# Job-Posting-Insights

![Business Communication Skills Analysis](https://img.shields.io/badge/Analysis-Business%20Communication-blue)
![Data Size](https://img.shields.io/badge/Data-1.5M%2B%20Jobs-green)
![Institution](https://img.shields.io/badge/Institution-Duke%20Fuqua-darkblue)

## 🔍 Overview

Job-Posting-Insights is a comprehensive analysis of over 1.5 million LinkedIn and Indeed job postings, focusing specifically on business communication skills demanded in today's job market. This project leverages large-scale web scraping, natural language processing, and data visualization techniques to identify patterns in how employers articulate their requirements for professional communication abilities.

Developed as part of business communication coursework at Duke University's Fuqua School of Business, this repository provides data-driven insights for job seekers, educators, professionals, and researchers interested in understanding the communication competencies most valued by employers.

## 📊 Key Features

- **Large-scale LinkedIn and Indeed job scraping methodology**
- **Text processing pipeline for communication skills extraction**
- **Word cloud and Bar Charts visualizations of key communication competencies**
- **Industry-specific communication skills analysis**
- **Seniority-level requirement differentiation**

## 🛠️ Technology Stack

- Python for data collection and processing
- R for the rest
  
## 📂 Repository Structure

```
├── data/                      # Data directory (not included - see Data Availability section)
│   ├── raw/                   # Raw scraped LinkedIn job listings
│   ├── processed/             # Processed for Analysis
│   
├── Code/                      # Jupyter notebooks
│   ├── 01_data_collection and processing.ipynb    # Web scraping methodology, Text cleaning and processing   
│   ├── 02 Code.R              # Data Analysis and Visualzations.
├── results/                   # Generated visualizations and findings
│   ├── wordclouds/            # Word cloud images by Role/Seniority/Importance
│   └── barcharts/             # Bar Chart Images by Role/Seniority/Importance
├── requirements.txt           # Project dependencies
├── LICENSE                    # License information
└── README.md                  # Project documentation
```

## 🚀 Getting Started

### Prerequisites

- Python 3.8+
- R

### Installation

```bash
# Clone the repository
git clone https://github.com/divij5267/Job-Posting-Insights.git
cd Job-Posting-Insights

# Set up virtual environment
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate

# Install dependencies
pip install -r requirements.txt
```

## 🔬 Methodology

We conducted two distinct analyses to capture different aspects of communication skills importance:

1. **Frequency Analysis**: Words/tokens were counted each time they appeared in job descriptions, giving higher weight to repeatedly mentioned skills within a single posting.

2. **Presence Analysis**: Each word/token was counted only once per job description regardless of repetition, focusing on the breadth of skills demanded rather than repetition emphasis.

This dual approach provides complementary views of the data:
- Frequency analysis highlights skills that employers emphasize through repetition
- Presence analysis reveals the diversity of communication skills required across positions

The resulting word clouds and analyses from both methods offer unique insights into how employers value and articulate communication requirements.


## 📈 Key Findings

Our analysis of 1.5 million+ LinkedIn job descriptions reveals significant patterns in how employers articulate business communication requirements:

### Frequency Analysis Insights
- "Report" emerges as the dominant communication-related term across job postings, suggesting report writing/preparation is the most valued communication skill
- "Document" appears as the second most frequent term, highlighting the importance of documentation skills
- "Collaborate" features prominently, indicating that employers highly value team communication abilities
- There is a steep decline after the top few terms, showing a clear hierarchy in communication priorities
- Terms like "presentation," "meeting," and "stakeholder" demonstrate the importance of formal communication channels
- The frequency distribution follows a classic long-tail pattern, with a small set of communication terms appearing much more frequently than others

### Presence Analysis Insights
- Even when controlling for repetition within job descriptions, "report" remains the most frequently mentioned communication skill
- The word cloud for presence analysis shows greater visual balance between terms compared to frequency analysis
- Terms related to collaboration and teamwork maintain significant prominence even when counted only once per job
- Industry-specific communication terms appear more prominently in the presence analysis
- The presence analysis reveals a broader, more diverse set of business communication requirements that might be overlooked in pure frequency analysis
- "Communicate" itself appears as a distinct requirement, showing that explicit communication skills are directly requested

### Combined Findings
- Written communication skills (reporting, documentation) consistently outrank other forms of business communication
- Both analysis methods show that employers value communication that serves organizational purposes (reports, documentation) over general communication abilities
- Collaborative communication is fundamentally important across the job market
- The consistency between both analysis methods validates the importance of the top communication skills identified


## 🔒 Data Availability

Due to LinkedIn's Terms of Service, we cannot share the raw scraped data. However, we provide:
- Sample processed data files (anonymized)
- Complete code for those who wish to collect their own data
- Aggregated analysis results and visualizations

## 📚 Citation

If you use this work in your research or projects, please cite:

```
@misc{JobPostingInsights2025,
  author = {Divij Yanduru},
  title = {Job-Posting-Insights: Analysis of Business Communication Skills in 1.5M+ Job Listings},
  year = {2025},
  publisher = {GitHub},
  journal = {GitHub repository},
  howpublished = {\url{https://github.com/divij5267/LinkedIn-Indeed-BizComm-Insights}}
}
```

## 📝 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📧 Contact

For questions or feedback, please reach out at yandurud@gmail.com or connect with me on [LinkedIn](https://www.linkedin.com/in/divijyanduru)

---

*This project was developed as part of the Business Communication curriculum at Duke University's Fuqua School of Business.*
