# Project Overview Page

The **Project Overview Page** is the central dashboard in SonarQube where 
you can get a comprehensive view of the health and quality of a project. It 
provides key insights into the state of the codebase, including important 
metrics like bugs, vulnerabilities, code smells, test coverage, and 
technical debt. This page helps developers, team leads, and managers assess 
the quality of their code and take action based on the analysis results.     

## Key Sections of the Project Overview Page

### 1. Project Summary

- **Project Name**: The name of the project.
- **Project Key**: A unique identifier for the project.
- **Branch**: The branch currently being analyzed (e.g., `main`, `develop`).
- **Last Analysis**: Date and time of the most recent analysis.

### 2. Key Metrics

- **Bugs**: The number of bugs detected in the code.
- **Vulnerabilities**: The number of potential security issues.
- **Code Smells**: The number of maintainability issues.
- **Duplications**: The percentage of duplicated code in the project.
- **Test Coverage**: The percentage of code covered by unit tests.
- **Reliability Rating**: A measure of the severity of bugs.
- **Security Rating**: A measure of the severity of vulnerabilities.
- **Maintainability Rating**: A measure of the project's overall maintainability.

### 3. Quality Gate Status

Displays the status of the **Quality Gate**, which is a set of conditions 
that a project must pass to be considered in good health. For example, the 
quality gate could require that the project has no critical issues or that 
test coverage exceeds a certain threshold.    

### 4. Issues

The issues section lists all the detected problems, categorized by severity 
(e.g., Blocker, Critical, Major, Minor). It includes: 
- **New Issues**: Issues detected in the most recent analysis.
- **Fixed Issues**: Issues that have been resolved.
- **Open Issues**: Issues that are still present in the code.

### 5. Measures and Trends

- **Measures**: A detailed view of the project's quality metrics over time, 
  such as lines of code, complexity, and duplications.
- **Trends**: Graphs that show the evolution of key metrics like test 
  coverage, technical debt, and quality ratings over time. 

### 6. Recent Activity

Displays recent changes in the project, such as code pushes, analysis 
results, or the resolution of issues. 

---

## Exercises

### Exercise 1: Navigate the Project Overview Page

**Objective**: 
Get familiar with the layout and key information on the Project Overview page.

**Tasks**:
1. Open the **Project Overview** page for a given project.
2. Identify and note the **key metrics** (bugs, vulnerabilities, test coverage).
3. Check if the project has passed or failed the **Quality Gate**.

---

### Exercise 2: Explore Issues in the Project

**Objective**: 
Learn how to filter and explore issues in a project.

**Tasks**:
1. Navigate to the **Issues** section.
2. Filter issues by severity (Blocker, Critical, Major).
3. Identify at least three issues that need immediate attention and record them.

---

### Exercise 3: Review Test Coverage and Technical Debt

**Objective**: 
Analyze test coverage and technical debt in the project.

**Tasks**:
1. Go to the **Test Coverage** and **Technical Debt** sections.
2. Check if the **test coverage** meets the project's standards (e.g., 80%).
3. Examine the **technical debt** and suggest potential actions to reduce it.
