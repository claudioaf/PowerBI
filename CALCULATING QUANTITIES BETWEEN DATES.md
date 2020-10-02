<h1 align="left"> CALCULATING QUANTITIES BETWEEN DATES </h1>

<p align="justify">In some situations it is necessary to calculate quantities (sum, count) between dates in the same table. To demonstrate the calculation we will use the example of how to calculate the <b>headcount</b> KPI.</p>
<p align="justify">We will use variables, and filter context to link the table D_CALENDAR to the table of admission and dismissal dates.</p>
<p align="justify">To build the example we use part of the HRDataset_v13.csv dataset for modeling and calculating the KPI, available in the kaggle repository.</p>
<p align="justify"><b>Dataset:</b>https://www.kaggle.com/rhuebner/human-resources-data-set</p>
<br>
<p align="justify"><b>1º STEP:</b> How to calculate</p>
<p align="justify">The calculation is performed from the difference between a minimum date and a maximum date</p>
<br>
<p align="justify"><b>2º STEP:</b> Formatting the company's termination date in Query Editor</p>

```json
[DT_RET] = null
then
DateTime.LocalNow() as datetime
else
[DT_RET]
```

