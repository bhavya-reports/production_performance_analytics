# production_performance_analytics
Manufacturing operations analytics case study using SQL, Python, Excel, Tableau, and AI-assisted analysis.
#Summary
A cement manufacturing operation is experiencing variation in production performance. This project investigates where production achievement varies and which operational factors are
associated with lower performance.
The analysis uses 3,200 cleaned production records covering January–June 2025.
The project demonstrates SQL, Python, statistical reasoning, Tableau, data-quality assessment, AI-assisted analysis and business decision support.

# Business Problem
Management wants to understand:
1. where production performance varies
2. whether performance differs between machines and shifts
3. whether downtime is associated with production achievement
4. whether quality and operational factors show meaningful relationships with production performance
The objective is to identify patterns that warrant further investigation rather than to establish causal relationships from observational data.

# Analytical Questions
1.What is the overall production achievement rate?
2.How does production achievement change over time?
3.Does performance differ between machines?
4.Does performance differ between shifts?
5.Is downtime associated with production achievement?
6.Is production performance associated with defective production?
7.Do operator experience and maintenance events appear associated with performance?

#Data Quality
The initial dataset contained 3,206 records.
Six exact duplicate records were identified and removed, producing a cleaned dataset of 3,200 records.
Missing values were retained rather than automatically imputed.
Blank maintenance-event values were treated as None for this analysis because only six records were blank and their average downtime was approximately the same as the existing None category.

# Methodology

SQL
Used for:
data validation
aggregation
monthly analysis
machine and shift comparisons
creation of analytical variables

Python
Used for:
exploratory data analysis
distributions
correlation analysis
group comparisons
statistical reasoning
visualization

Tableau
Used to create an interactive decision-support dashboard showing:
production achievement
production trend
machine performance
shift performance
downtime relationship
defect rate

AI
Used for:
hypothesis generation
SQL alternatives
code review
statistical-method explanations
analytical challenge
documentation

AI-generated suggestions were independently checked against the underlying data.

# Key results
KPI
Total production target-2,514,640 units
Total actual production-2,315,118 units
Overall target achievement-92.07%
Production shortfall-199,522 units
Total defective units-56,007
Overall defect rate-2.42%
Records with recorded downtime-3,195
Total recorded downtime-Approximately 2,879 hours
Average recorded downtime-Approximately 0.90 hours per recorded value

# Main conclusion

-Production performance varies considerably across machines and shifts. 
-Kiln B and the night shift are the clearest priorities for further investigation.
-Kiln B has lower production achievement, higher average downtime, and a higher defect rate than the other machines.
-Night-shift records also have lower achievement and higher downtime and defect rates.

# Recommended business action:
Investigate Kiln B and night-shift operating conditions using detailed maintenance records, downtime reason codes, process data, staffing information, and quality 
records before implementing operational changes.

# Analytical Findings
1.What is the overall production achievement rate?
Overall production achievement was 92.07%.
The operation produced 2,315,118 units against a target of 2,514,640 units, leaving a shortfall of 199,522 units.

* The aggregate production gap warrants investigation. Management should determine how much of the shortfall is concentrated in particular machines, shifts, 
or months before deciding how to allocate improvement resources.

2.How does production achievement change over time?
Monthly achievement weakened between January and June.
Achievement declined by approximately 1.66 percentage points from January to June.

3. Does performance differ between machines?
Yes. Kiln B has the lowest target achievement among the four machines
Machine-Target achievement-Average recorded downtime
Kiln A-93.12%-0.74 hours
Mill B-93.05%-0.76 hours
Mill A-92.99%-0.78 hours
Kiln B-89.51%-1.33 hours

* Kiln B combines a larger production gap with higher recorded downtime and a higher defect rate. This makes it the strongest machine-level candidate for a focused diagnostic review.

4. Does performance differ between shifts?
Yes. The night shift has substantially lower target achievement than the morning and afternoon shifts.
Shift

Target achievement-Average recorded downtime-Defect rate
Morning-94.76%-0.84 hours-2.26%
Afternoon-92.80%-0.85 hours-2.28%
Night-86.46%-1.08 hours-2.94%
Night-shift achievement is approximately 8.30 percentage points below morning-shift achievement.



# Tableau Public dashboard
<img width="1264" height="885" alt="Screenshot 2026-10-21 at 3 37 02 PM" src="https://github.com/user-attachments/assets/09531bbf-fb13-4dd0-a29a-18f35223c82f" />

# Skills Demonstrated

Business problem definition and operational KPI design
SQL data validation, aggregation, and group comparisons
Python data analysis, visualization, and correlation analysis
Excel-based validation and reporting
Tableau dashboard design and interactive filtering
Data-quality assessment and assumption documentation
AI-assisted analysis and critical validation
Statistical reasoning and cautious interpretation
Evidence-based recommendations and decision support

# AI and Data Disclosure:
The dataset used in this project was generated with AI for learning and portfolio purposes. AI also helped me formulate the initial analytical questions.
The subsequent SQL, Python, Excel, and Tableau work was completed by me, with AI assistance when I encountered difficulties.
The findings demonstrate my analytical process using simulated data and should not be interpreted as verified results from a real manufacturing company.



