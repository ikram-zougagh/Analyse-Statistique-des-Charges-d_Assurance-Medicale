# ![Statistical Modeling Icon](https://img.shields.io/badge/Statistical%20Modeling-Multiple_Linear_Regression-blue?style=for-the-badge&logo=r&logoColor=white)

## 🎯 **Project Goal**

This project aims to predict **medical insurance costs** using a **multiple linear regression** model. We analyze various factors such as age, Body Mass Index (BMI), smoking status, gender, and geographic region to understand their impact on insurance charges.

<p align="center">
  <img src="https://img.shields.io/badge/Tools-R-blue?style=flat-square&logo=r&logoColor=white" />
  <img src="https://img.shields.io/badge/Visualization-ggplot2-red?style=flat-square&logo=ggplot2&logoColor=white" />
  <img src="https://img.shields.io/badge/Data_Analysis-Pandas-green?style=flat-square&logo=pandas&logoColor=white" />
</p>

---

## 📊 **Dataset Overview**

The dataset used in this project contains information about insured individuals, including:

- **age**: Age of the insured
- **bmi**: Body Mass Index
- **children**: Number of children covered by the insurance
- **smoker**: Smoking status (yes/no)
- **sex**: Gender of the insured (male/female)
- **region**: Geographic region of residence
- **charges**: Medical insurance costs (target variable)

---

## 🛠 **Tools & Libraries Used**

- **Programming Language**: R
- **Key Libraries**:
  - `ggplot2`: For data visualization
  - `readxl`: For loading data from Excel files
  - `car`: For multicollinearity tests
  - `lmtest`: For residual analysis

---

## 🧠 **Methodology**

### 1. **Data Preprocessing**
- **Missing Values**: The dataset does not contain missing values, so no imputation is necessary.
- **Categorical Encoding**: Categorical variables such as `sex`, `smoker`, and `region` were encoded into binary or dummy variables for regression.

### 2. **Exploratory Data Analysis**
- **Variable Distribution**: Visualized distributions of variables like age, BMI, and charges using `ggplot2`.
- **Correlation**: Examined correlations between quantitative variables with a heatmap produced by `corrplot`. Significant correlations were found between charges and factors like smoking status.

### 3. **Model Building**
- **Multiple Linear Regression**:
  - The model was built using R's `lm()` function.
  - Independent Variables: `age`, `sex`, `bmi`, `children`, `smoker`, `region`.
  - Dependent Variable: `charges`.

---

## 🚀 **Results**

The most influential factors on insurance charges were:
- **Smoking status**: Smokers have significantly higher insurance charges.
- **Body Mass Index (BMI)**: Higher BMI is associated with increased costs.
- **Age**: Older individuals tend to pay higher insurance charges.

The final model demonstrated good performance, providing reliable predictions of insurance costs based on the insured's characteristics.

---

## 🏁 **Conclusion**

The multiple linear regression model developed effectively predicts medical insurance charges based on demographic and behavioral characteristics. The results highlight the importance of factors such as smoking status and BMI in determining insurance costs. This model can be further used for future analyses and help insurance companies better understand the factors influencing their pricing strategies.
