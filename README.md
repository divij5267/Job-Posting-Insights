# LinkedIn/Indeed-BizComm-Insights

![Business Communication Skills Analysis](https://img.shields.io/badge/Analysis-Business%20Communication-blue)
![Data Size](https://img.shields.io/badge/Data-1.5M%2B%20Jobs-green)
![Institution](https://img.shields.io/badge/Institution-Duke%20Fuqua-darkblue)

## 🔍 Overview

LinkedIn-BizComm-Insights is a comprehensive analysis of over 1.5 million LinkedIn job postings, focusing specifically on business communication skills demanded in today's job market. This project leverages large-scale web scraping, natural language processing, and data visualization techniques to identify patterns in how employers articulate their requirements for professional communication abilities.

Developed as part of business communication coursework at Duke University's Fuqua School of Business, this repository provides data-driven insights for job seekers, educators, professionals, and researchers interested in understanding the communication competencies most valued by employers.

## 📊 Key Features

- **Large-scale LinkedIn job scraping methodology**
- **Text processing pipeline for communication skills extraction**
- **Word cloud visualizations of key communication competencies**
- **Industry-specific communication skills analysis**
- **Seniority-level requirement differentiation**
- **Trend analysis of evolving communication skills demands**

## 🛠️ Technology Stack

- Python for data collection and processing
- BeautifulSoup/Selenium for web scraping
- NLTK/spaCy for natural language processing
- Pandas for data manipulation
- Matplotlib/Wordcloud for visualizations
- Jupyter notebooks for analysis documentation

## 📂 Repository Structure

```
├── data/                      # Data directory (not included - see Data Availability section)
│   ├── raw/                   # Raw scraped LinkedIn job listings
│   ├── processed/             # Processed job descriptions
│   └── analysis/              # Analysis results
├── notebooks/                 # Jupyter notebooks
│   ├── 01_data_collection.ipynb    # Web scraping methodology
│   ├── 02_data_processing.ipynb    # Text cleaning and processing
│   ├── 03_skills_extraction.ipynb  # Communication skills identification
│   └── 04_visualization.ipynb      # Word cloud generation
├── src/                       # Source code
│   ├── scraper/               # LinkedIn scraper code
│   ├── processor/             # Text processing utilities
│   ├── analyzer/              # Analysis algorithms
│   └── visualizer/            # Visualization code
├── results/                   # Generated visualizations and findings
│   ├── wordclouds/            # Word cloud images by industry/seniority
│   └── reports/               # Analysis reports
├── requirements.txt           # Project dependencies
├── LICENSE                    # License information
└── README.md                  # Project documentation
```

## 🚀 Getting Started

### Prerequisites

- Python 3.8+
- Required packages (see requirements.txt)

### Installation

```bash
# Clone the repository
git clone https://github.com/your-username/LinkedIn-BizComm-Insights.git
cd LinkedIn-BizComm-Insights

# Set up virtual environment
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate

# Install dependencies
pip install -r requirements.txt
```

### Usage

1. **Data Collection** (note: we provide processed data samples due to LinkedIn's Terms of Service)
   ```bash
   python src/scraper/run_scraper.py --config config/scraper_config.yaml
   ```

2. **Analysis Pipeline**
   ```bash
   python src/processor/process_jobs.py --input data/raw --output data/processed
   python src/analyzer/extract_skills.py --input data/processed --output data/analysis
   ```

3. **Generate Visualizations**
   ```bash
   python src/visualizer/create_wordclouds.py --input data/analysis --output results/wordclouds
   ```

Alternatively, you can follow the step-by-step process in the Jupyter notebooks.

## 📈 Key Findings

Our analysis reveals several interesting patterns in how employers articulate their communication needs:

- Written communication remains the most frequently mentioned skill across all industries
- Industry-specific communication requirements vary significantly (e.g., technical writing in tech, persuasive communication in sales)
- Senior roles emphasize strategic communication and leadership communication skills
- Digital communication platforms and tools feature prominently in recent job listings
- Cross-cultural communication abilities are increasingly valued in global companies

## 🔒 Data Availability

Due to LinkedIn's Terms of Service, we cannot share the raw scraped data. However, we provide:
- Sample processed data files (anonymized)
- Complete code for those who wish to collect their own data
- Aggregated analysis results and visualizations

## 📚 Citation

If you use this work in your research or projects, please cite:

```
@misc{LinkedInBizCommInsights2025,
  author = {Your Name},
  title = {LinkedIn-BizComm-Insights: Analysis of Business Communication Skills in 1.5M+ Job Listings},
  year = {2025},
  publisher = {GitHub},
  journal = {GitHub repository},
  howpublished = {\url{https://github.com/your-username/LinkedIn-BizComm-Insights}}
}
```

## 📝 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📧 Contact

For questions or feedback, please reach out at your.email@duke.edu or connect with me on [LinkedIn](https://www.linkedin.com/in/your-profile/).

---

*This project was developed as part of the Business Communication curriculum at Duke University's Fuqua School of Business.*
