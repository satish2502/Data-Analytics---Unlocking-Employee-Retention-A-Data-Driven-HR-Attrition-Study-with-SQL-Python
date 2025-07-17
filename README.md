## Unlocking-Employee-Retention-A-Data-Driven-HR-Attrition-Study-with-SQL-Python

### 1. Objective
The primary aim of this project is to analyze drivers of employee attrition within a mid-sized enterprise, using data extracted from an HR database. By performing systematic data cleaning and end-to-end exploratory data analysis (EDA), the study seeks to:

Identify the personal, professional, and organizational factors most strongly associated with employees leaving the company.

Quantify attrition rates across different segments (e.g., departments, job roles, demographics).

Uncover interaction effects (e.g., overtime + work-life balance) that elevate turnover risk.

Provide actionable recommendations to HR leadership for reducing unwanted attrition.

### 2. Dataset Used

Source: A SQL Server table named HR_Attrition_Unclean in the HrAnalytics database.

Extraction: Data pulled into a Pandas DataFrame via pyodbc and pd.read_sql().

Volume & Features: Approximately 1,470 records and 30+ columns, capturing:

Demographics: EmployeeID, Age, Gender, MaritalStatus, DistanceFromHome

Job Details: Department, JobRole, BusinessTravel, DateOfJoining, YearsAtCompany

Compensation & Performance: MonthlyIncome, PerformanceRating, Education

Engagement & Workload: OverTime flag, training times, work-life balance ratings

Cleaned Version: After rigorous cleaning, saved as Attrition cleaned data.csv for analysis.

### 3. Business Questions Solved

Which demographic segments (age, gender, marital status) exhibit the highest attrition rates?

How do job-related factors (department, role, business travel, tenure) correlate with turnover?

What is the impact of compensation (monthly income) on an employee’s decision to stay or leave?

How do overtime and perceived work-life balance jointly affect attrition risk?

Which departments or roles require targeted interventions to stem high attrition?

Are there non-linear or binned relationships (e.g., tenure buckets, income brackets) that highlight risk thresholds?

### 4. Process

Data Extraction & Initial Inspection

Connected to SQL Server using Windows Authentication.

Executed SELECT * on HR_Attrition_Unclean.

Loaded into Pandas; performed df.head(), .info(), and .drop_duplicates() to assess structure and redundancy.

Feature-Wise Cleaning

EmployeeID: Ensured all IDs are present and unique; imputed or removed invalid entries.

Age & MonthlyIncome: Converted non-numeric entries to numeric; handled outliers via logical bounds (e.g., 18–65 for age).

Categorical Fields (Department, JobRole, BusinessTravel, MaritalStatus, Gender): Standardized strings, unified case, corrected typos, and mapped to consistent categories.

DateOfJoining: Parsed into datetime; derived tenure features (YearsAtCompany) to cross-validate with reported values.

OverTime & PerformanceRating: Verified binary flags and rating scales; imputed or dropped missing data.

Saving Cleaned Data

Exported the cleaned DataFrame to Attrition cleaned data.csv for reproducible EDA.

### Exploratory Data Analysis

#### Univariate Analysis:

Attrition rate overall and by single categorical features (e.g., Department, Gender).

Distribution plots for numeric variables.

#### Bivariate & Segmentation:

Cross-tabs of Attrition vs. JobRole, BusinessTravel, MaritalStatus.

Boxplots of MonthlyIncome segmented by Attrition status.

#### Tenure & Experience Analysis:

Scatter plots and line charts of YearsAtCompany vs. attrition probability.

Binned tenure groups to identify “critical” departure windows.

#### Overtime & Work-Life Balance Interaction:

Joint violin and bar plots showing attrition rates for combinations of Overtime = Yes/No and work-life balance ratings.

#### Correlation Analysis:

Heatmap of numeric features vs. Attrition target.

#### Advanced EDA:

Root cause analysis for departments with highest turnover (e.g., Research & Development).

Multi-dimensional risk segmentation combining tenure, income, and performance.

Promotion stagnation (YearsSinceLastPromotion) vs. attrition.

Income satisfaction mismatch: comparing actual pay vs. department averages.

Heatmaps of MonthlyIncome × JobRole vs. Attrition.

Three-way analysis: BusinessTravel frequency × Overtime × Department.

### 5. Key Insights

Overall Attrition: Approximately 16% of employees left within the observed period.

Departmental Hotspots: Research & Development experienced the highest attrition (~20%), followed by Sales (~18%).

Compensation Effect: Employees in the lowest two income quintiles were twice as likely to leave compared to top quintiles.

Tenure Window: Attrition spikes during years 1–3, indicating early-career turnover risk. After year 5, turnover plateaus at a lower rate.

Overtime & Work-Life Balance:

Those reporting poor work-life balance and working overtime had a staggering 35% attrition rate versus 8% for those without overtime.

Travel Demands: High-frequency business travelers showed an elevated attrition risk, especially when combined with low income.

Promotion Stagnation: Employees who had not been promoted in over four years exhibited 1.8× higher turnover.

### 6. Recommendations

#### Compensation Review:
Implement targeted salary adjustments or bonus schemes for the bottom two income quintiles, particularly early-career roles.

#### Onboarding & Early Engagement: 
Develop mentorship and career-path programs focused on the first 36 months to reduce early-career churn.

#### Overtime Management:

Enforce mandatory rest periods.

Introduce flexible scheduling or job-sharing in high-overtime roles.

Travel Policies: Offer travel allowances, remote-work options, or wellness stipends to frequent travelers.

#### Promotion & Development:

Accelerate promotion pipelines with clear upskilling paths.

Host quarterly “career check-ins” to identify stagnation early.

#### Departmental Interventions:

For R&D and Sales, conduct focus groups to diagnose culture, manager support, and workload concerns.

Roll out pulse surveys specifically within high-turnover teams.

### 7. Conclusion
Through meticulous end-to-end cleaning and layered EDA, this analysis surfaces the multi-faceted drivers of HR attrition. Early-career employees in low-pay roles, those subjected to excessive overtime without work-life support, and individuals feeling promotion stagnation represent the highest turnover risk. By acting on tailored compensation, career development, and well-being initiatives—especially within Research & Development and Sales—the organization can meaningfully curb attrition, stabilize its talent base, and foster long-term employee engagement.
