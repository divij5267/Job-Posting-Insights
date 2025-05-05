# devtools::install_github("benyamindsmith/RKaggle")
# Sys.setenv(KAGGLE_CONFIG_DIR = "~/Downloads/kaggle.json")
# Sys.getenv("KAGGLE_CONFIG_DIR")
# library(RKaggle)
# dataset_identifier <- "ghostjobs/january-2025-60k-jobs-indeed"
# data_1 <- get_dataset(data_identifier)
setwd("~/Desktop")
# install.packages("tidytext");install.packages("stringr");install.packages("textstem");install.packages("wordcloud");install.packages("RColorBrewer")
library(jsonlite); library(data.table);library(tidytext);library(stringr);library(dplyr);library(ggplot2);library(textstem);library(wordcloud);library(RColorBrewer)
load("RA.RData")
#Data Loading
data <- fromJSON("job_report.json")
#--------------------------------------------
data_1 <- fread("postings.csv")
#--------------------------------------------
data_2 <- fread("job_skills_a.csv")
data_3 <- fread("job_summary_a.csv")
data_4 <- fread("linkedin_job_postings_a.csv")
#--------------------------------------------
data_5 <- fread("job_skills_b.csv")
data_6 <- fread("job_summary_b.csv")
data_7 <- fread("job_postings_b.csv")
#--------------------------------------------
#Data Analysis
us_states <- c(
  "AL","AK","AZ","AR","CA","CO","CT","DE","FL","GA","HI","ID","IL","IN","IA","KS",
  "KY","LA","ME","MD","MA","MI","MN","MS","MO","MT","NE","NV","NH","NJ","NM","NY",
  "NC","ND","OH","OK","OR","PA","RI","SC","SD","TN","TX","UT","VT","VA","WA","WV",
  "WI","WY","DC","PR","VI","GU","AS","MP"          
)
states <- sprintf(",\\s*(%s)$", paste(us_states, collapse = "|"))
#--------------------------------------------

min(data_7$first_seen);max(data_7$first_seen)
data_7 <- merge(data_7, data_6, by = "job_link", all.x = TRUE) 
data_7 <- merge(data_7, data_5, by = "job_link", all.x = TRUE)
Data_7 <- data_7[ grepl(states, job_location) | grepl("United\\s+States\\s*$", job_location) ]
unique(Data_7$job_level)
Data_7 <- Data_7[job_level == "Associate"]
#--------------------------------------------
min(data_1$first_seen);max(data_1$first_seen)
unique(data_1$`job level`)
class(data_1$`job level`)
Data_1 <- data_1[ grepl(states, job_location) | grepl("United\\s+States\\s*$", job_location) ]
Data_1 <- Data_1[`job level` == "Associate"]
#--------------------------------------------
min(data_4$first_seen);max(data_4$first_seen)
data_4 <- merge(data_4, data_3, by = "job_link", all.x = TRUE)
data_4 <- merge(data_4, data_2, by = "job_link", all.x = TRUE)
Data_4 <- data_4[grepl("United\\s+States\\s*$", job_location) ]
unique(Data_4$job_level)
Data_4 <- Data_4[job_level == "Associate"]
#--------------------------------------------
Data <- as.data.table(data$jobs)
sum(!is.na(Data$job_level))
unique(Data$location.country)
sum(is.na(Data$location.country))
Data <- Data[Data$location.country == "US"]
#--------------------------------------------
# Data Preparation
keep_cols <- c("job_title","first_seen", "job_summary", "job_skills")
Data_7s <- Data_7[, ..keep_cols]
Data_1s <- Data_1[, ..keep_cols]
Data_4s <- Data_4[, ..keep_cols]
all_jobs <- rbindlist(list(Data_7s, Data_1s, Data_4s),use.names = TRUE,fill= TRUE)
roles <- c("business analyst","data analyst","data scientist","finance analyst")
# Data cleaning
clean_descr <- function(x) {
  x |>
    str_remove_all("<.*?>") |>      # strip HTML tags
    str_remove_all("\\*\\*") |>     # remove markdown bold **
    str_replace_all("[^A-Za-z ]", " ") |> # keep letters & spaces
    str_squish() |>
    tolower()
}

subset_dt <- rbindlist(lapply(roles, function(a) {all_jobs[tolower(job_title) %like% a,.(role = a,description_clean = clean_descr(job_summary))]}))
subset_dt_1 <- rbindlist(lapply(roles, function(a) {all_jobs[tolower(job_title) %like% a,.(role = a,description_clean = clean_descr(job_skills))]}))
# Tokenization
#--------------------------------------------
#based on the frequency of the word
tokens <- subset_dt[, .(id = .I, role, text = description_clean)] |>unnest_tokens(word, text) |> anti_join(stop_words, by = "word") |> dplyr::mutate(word = lemmatize_words(word))      
tokens_1 <- subset_dt_1[, .(id = .I, role, text = description_clean)] |>unnest_tokens(word, text) |> anti_join(stop_words, by = "word") |> dplyr::mutate(word = lemmatize_words(word))      
comm_vocab <- c(
  "communicate","articulate","convey","brief","clarify","summarise","consult",
  "coordinate","collaborate","facilitate","negotiate","persuade","influence",
  "present","pitch","report","update","escalate","liaise","advocate",
  "listen","empathy","interpersonal","rapport","diplomacy","tact","stakeholder",
  "consensus","relationship","engagement","write","copywriting","edit",
  "proofread","outline","draft","document","email","proposal","newsletter",
  "storytelling","clarity","concise","presentation","slide","visual","audience",
  "takeaway","transition","highlight","teamwork","cross","align","delegate",
  "motivate","coaching","mentoring","feedback","brainstorm","partnership",
  "conflict","resolution","persuasion","negotiation","compromise","win",
  "mediation","resolve","assertive","transparent","positive","constructive",
  "diplomatic","professional","courteous"
)
#--------------------------------------------
#based on the word in the description rather than the frequency
tokens_unique <- unique(tokens, by = c("id", "word"))
tokens_unique_1 <- unique(tokens_1, by = c("id", "word"))
#--------------------------------------------
#Bar-Plot
make_bar <- function(df, role, top_n = 50) {
  df %>%
    filter(role == !!role) %>%              # keep one role
    count(word, sort = TRUE) %>%
    slice_head(n = top_n) %>%
    mutate(word = reorder(word, n)) %>%     # for proper ordering
    ggplot(aes(word, n)) +
    geom_col(fill = "steelblue") +
    coord_flip() +
    labs(title = paste("Top", top_n, "words –", tools::toTitleCase(role)),
         x = NULL, y = "Frequency") +
    theme_minimal(base_size = 12)
}

#Word-Plot
make_cloud <- function(df, role, min_freq = 3, max_words = 50) {
  df %>%
    filter(role == !!role) %>%
    count(word, sort = TRUE) %>%
    with(
      wordcloud(word,
                n,
                min.freq   = min_freq,
                max.words  = max_words,
                random.order = FALSE,
                colors     = brewer.pal(8, "Dark2"),
                scale      = c(3, 0.7))
    )
  title(main = paste("Word Cloud –", tools::toTitleCase(role)), cex.main = 1)
}
#-------------------------------------
#Plots
token_tbl <- tokens_unique %>%filter(word %in% comm_vocab)
for (r in roles) {
  print(make_bar(token_tbl, r, top_n = 50))   # frequency bar chart
  make_cloud(token_tbl, r)                    # word cloud
}

make_cloud(tokens %>%filter(word %in% comm_vocab), "data scientist")
make_cloud(tokens %>%filter(word %in% comm_vocab), "data analyst")
make_bar(tokens %>%filter(word %in% comm_vocab), "business analyst", top_n = 50)
make_bar(tokens_unique %>%filter(word %in% comm_vocab), "business analyst", top_n = 50)
#--------------------------------------------
lin <- as.data.table(read_excel("research data.xlsx", sheet = "Lin", col_names = TRUE))
ananya <- as.data.table(read_excel("research data.xlsx", sheet = "Ananya", col_names = TRUE))
research <- rbindlist(list(lin, ananya),use.names = TRUE,fill= TRUE)
#--------------------------------------------
setnames(research, c("No", "Gender", "Age", "Track", "Before", "After", "Comm"))

role <- c("business analyst","consulting","data analyst","data engineer",
          "data scientist","financial analyst","investment associate",
          "market researcher","quantitative analyst","compliance analyst")
roles_lc <- lemmatize_strings(tolower(role))