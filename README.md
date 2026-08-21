Nigeria Malaria Incidence Analysis (2000–2024)

An end-to-end data analytics project examining 25 years of monthly malaria surveillance data across 8 Nigerian states, covering data cleaning, exploratory analysis, and an interactive Power BI dashboard.

Demo Video

Watch the full walkthrough here: [Project Demo Video](https://drive.google.com/file/d/127VjprQU2-dFBax0B2lKdw2FrfKZrAra/view?USp=sharing)

Project Objective

Analyze malaria incidence data to identify trends, seasonal patterns, and geographic variations across Nigeria, and translate those findings into data-driven recommendations for malaria prevention and control.

Dataset
Source: Nigeria Monthly Malaria Data (2000–2024)
Size: 2,400 rows × 9 original columns
Coverage: 8 states across all 6 geopolitical zones — Kano, Kaduna, Borno, Kwara, Lagos, Ogun, Rivers, Enugu
Granularity: Monthly, Jan 2000 – Dec 2024
Key fields: Confirmed Cases, Malaria Deaths, Malaria Incidence per 1,000, State, Region, Date
Tools & Workflow
Stage	Tool
Data cleaning & feature engineering	Excel
Exploratory Data Analysis	MySQL
Dashboard development	Power BI
1. Excel — Cleaning & Feature Engineering
Verified data integrity (no missing values or duplicates found)
Engineered three new columns:
Season (Rainy: Apr–Oct / Dry: Nov–Mar)
Mortality Rate (%) = Deaths / Confirmed Cases × 100
Quarter
Validated findings with pivot tables before moving to SQL
2. MySQL — Exploratory Data Analysis

Queried the cleaned dataset to answer each analysis objective:

Yearly national trends (incidence & mortality)
Monthly/seasonal case distribution
State and regional burden ranking (raw totals vs. per-capita rate)
Five-year window comparison (2000–04 vs 2020–24) per state
Quarterly aggregation

See sql/eda_queries.sql for the full set of queries.

3. Power BI — Interactive Dashboard

A 4-page report:

Overview — national KPIs and 25-year trend lines (incidence & mortality)
Seasonal & Geographic Patterns — monthly/quarterly seasonality and state comparisons
State Deep Dive — interactive single-state trend vs. national average, with slicer-driven filtering
Recommendations — key findings translated into actionable recommendations

A custom color theme was applied: green (case/incidence data), red (mortality/deaths), and amber (seasonal patterns) — chosen deliberately so each chart's color reinforces its meaning at a glance.

See powerbi/ for the .pbix file and screenshots/ for page previews.

Key Findings
National incidence rate fell ~26% (29.7 → 21.97 per 1,000) from 2000 to 2024, even as raw case counts rose — explained by population growth outpacing case growth.
Mortality rate fell ~40% (0.42% → 0.25%) over the same period, steadily, with no reversals — suggesting sustained improvement in treatment/prevention effectiveness.
Clear seasonal pattern: cases peak Aug–Oct (rainy season), with a lag effect extending elevated incidence into November and December after rains ease. April, despite being early rainy season, does not show an immediate spike.
State burden ranking shifts depending on metric used: Kano and Kaduna lead on both raw case count and incidence rate. However, Lagos ranks 3rd by raw cases but drops to 6th by incidence rate (population-driven), while Borno ranks 5th by raw cases but rises to 3rd by rate — indicating its per-capita burden is understated by volume alone.
All 8 states improved at a similar pace (~22–24% incidence decline) between 2000–04 and 2020–24, though the absolute gap between highest- and lowest-burden states has not closed.
Recommendations
Prioritize Kano and Kaduna for sustained intervention given persistently high absolute burden.
Allocate resources using incidence rate (not just raw case volume) to avoid underestimating states like Borno.
Scale up prevention efforts 6–8 weeks before peak season to account for the transmission lag effect.
Sustain current national interventions, given the consistent mortality decline across all states.
Further investigate the April lag to refine early-warning systems.
Repository Contents
├── data/            → cleaned dataset with engineered columns
├── sql/              → eda_queries.sql (MySQL EDA queries)
├── powerbi/          → Apete_Balikis_Capstone.pbix (dashboard file)
└── screenshots/      → dashboard page previews
Author

Apete Balikis Olanike — Data Analyst | 3MTT Fellow (Airtel Nextgen Cohort)
