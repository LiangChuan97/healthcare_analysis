### Healthcare Dataset Analysis ###

With an ageing population and rising healthcare costs, making data-driven decisions to optimize operations, reduce costs and improve patient care outcomes are necessary. <p>Thus, the goals of this project are to<p>Goal 1: Understand patient demographics and hospital service demand.<p>
Goal 2: Analyze hospital, doctor, and admission type utilization.<p>
Goal 3: Examine length of stay trends and factors affecting it.


**Problem:** 
1.	**Patient Demographics & Service Demand**<p>Which age groups or genders visit hospitals most?<p>Which insurance providers contribute the most to hospital revenue?<p>
2. **Hospital & Doctor Utilization**<p>Which hospitals and doctors handle the most patients?<br>How does admission type (emergency/elective/urgent) affect hospital load?<p>
3. **Length of Stay Analysis**<p>Which factors (medical condition and medication) influence stay length?


**Methodology:** Data was sourced from <a href = "https://www.kaggle.com/datasets/prasad22/healthcare-dataset">kaggle </a>, cleaned and transformed using SQL. Exploratory data analysis was performed to identify trends and correlations. An interactive dashboard was then developed in tableau to present key findings.

**Key Findings:** <p>
1) Age 40–60 accounts for 29.73% of total patients, with male patients averaging $25,465.7 billing per admission vs females at $25,438.8.<p>
2) Insurance Provider “Cigna” covers 20.2% of patients and contributes 20.3% of total revenue ($206,914,158).<p>
3) Middle-aged patients are the largest revenue contributors; Cigna contributes the highest revenue due to covering the insurance of bulk number of patients.<p>
4) LLC Smith handles 30 patients/year, avg stay 14.3 days.<p>
5) Group Smith handles 28 patients/year, avg stay 14.9 days.<p>
6) LLC Smith may need more staffing and resources to handle higher patient load.<p>
7) Dr. John Smith sees 18 patients/year, avg stay 14.8days.<p>
8) Dr. Michael Smith sees 18 patients/year, avg stay 17 days.<p>
9) Doctors may be overbooked; workload distribution could be optimized.<p>
10) Although Emergency admission has less number of patients, the average length of stay is the highest which indicates more resources per patient.<p>
11) Patients with asthma average 15.7 days, while patients with diabetes average 15.4 days.<p>
12) Penicillin reduces averages stay to 15.6 days, while Ibuprofen averages 15.4 days.<p>
13) Departments like pulmonology require longer care; certain medications improve efficiency and reduce patient stay.


**Recommendation:** 
1) Patient Demographics & Revenue<p>
	•	Target middle-aged patients (40–60): Since they account for ~30% of patients and bring in the highest billing, hospitals can design preventive care packages and chronic disease management programs for this group to sustain revenue.<p>
	•	Strengthen insurance partnerships with Cigna: Cigna covers ~20% of patients and contributes the highest revenue. Negotiating better terms, co-branded health programs, or bundled service packages with Cigna could further grow this revenue stream.<p>
	•	Gender-based billing similarity: Since billing is nearly equal across genders, hospitals should maintain equitable service offerings, focusing instead on patient condition and insurance factors as bigger differentiators.<p>

2) Hospital & Doctor Utilization<p>
	•	Resource planning for hospitals: “LLC Smith” and “Group Smith” have the highest patient load and long stays (14+ days). These facilities should be prioritized for additional staffing, infrastructure, and possibly bed expansion.<p>
	•	Optimize doctor workloads: Doctors John Smith and Michael Smith both see 18 patients/year but with long average stays (14–17 days). This suggests possible bottlenecks in case complexity or scheduling. Consider redistributing patients, hiring support staff, or introducing specialized care teams.<p>
	•	Admission type strategy: Emergency patients are fewer but consume more resources per stay. Hospitals should allocate higher resource intensity (ICU beds, specialist availability) to emergencies while maintaining efficiency for elective cases.<p>

**Conclusion:** <p>The analysis highlights that middle-aged patients and Cigna insurance plans are the primary drivers of hospital revenue, making them strategic focus areas for financial growth. On the operations side, LLC Smith and Group Smith hospitals face high patient volumes with long stays, indicating the need for improved staffing and resource allocation. Additionally, doctor workloads appear uneven, with long-stay cases concentrated among a few physicians. Finally, emergency admissions, though fewer, consume more resources, suggesting that specialized emergency resource planning is essential.


