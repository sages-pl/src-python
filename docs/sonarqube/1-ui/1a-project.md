# Concept of Projects

In **SonarQube**, a **project** is the central unit of analysis for code 
quality and security within the platform. It represents a specific codebase,
application, or module that you want to analyze for issues such as bugs, 
vulnerabilities, code smells, and other quality metrics. Projects in 
SonarQube can be analyzed individually or as part of a larger system, 
allowing for focused tracking of a single application's health.     

A **project** typically corresponds to a single application, service,
or module that is being analyzed for code quality. It's a container for 
various metrics, issues, and configuration settings that SonarQube uses 
to track and evaluate the state of the codebase.   

## Project Key and Name

- **Project Key**: A unique identifier for the project.
- **Project Name**: A human-readable name displayed in the interface.

## Project Analysis

- **Bugs**: Issues that could cause runtime errors or unexpected behavior.
- **Vulnerabilities**: Potential security threats such as SQL injection or XSS.
- **Code Smells**: Maintainability problems that may not be critical but 
  can make code harder to understand or maintain. 

## Quality Gate

Each project can be associated with a **Quality Gate**, which is a set of 
conditions that the project must meet to be considered "healthy." For 
example, the quality gate might require that the project has no critical 
bugs or that test coverage exceeds a certain percentage.   

## Measures and Trends

- **Test Coverage**: Percentage of code covered by automated tests.
- **Duplication**: Percentage of duplicated code in the project.
- **Varius Ratings**: Reliability, security, and maintainability ratings
  based on the detected issues.

## Project Dashboard

Each project has its own **dashboard**, offering a high-level view of its 
analysis results, including key metrics, issues, trends, and quality gate 
status.  

## Project Customization

- **Rules**: Define which quality and security rules to apply during analysis.
- **Notifications**: Set up alerts to notify team members about new issues 
  or quality gate failures. 
- **Branch Analysis**: SonarQube supports analyzing different branches of 
  the project, allowing teams to track the quality of code in various stages 
  of development.  

## Multi-Module Projects

For larger applications with multiple components, SonarQube can handle 
**multi-module projects**, where each module is treated as a sub-project 
within the main project. This is especially useful for microservices 
architectures or monolithic applications with distinct modules.   

## Conclusion

In summary, the **project** concept in SonarQube is vital for organizing 
and tracking code quality over time. By setting up projects, teams can 
analyze individual applications, monitor key quality metrics, enforce 
quality gates, and prioritize issues to maintain healthy, secure, and 
maintainable code.    

---

## Exercises

### Exercise 1: Navigating the Project List

**Objective:** 
Familiarize yourself with the main dashboard and its features.

**Task**:
1. Open the SonarQube instance.
2. Explore the **Project List Page**.
3. Identify and note the following information for each project:
   - **Project Name**
   - **Quality Gate Status** (e.g., Passed/Failed)
   - **Last Analysis Date**
   - **Technical Debt**
4. Try sorting the list of projects by:
   - Last Analysis Date
   - Technical Debt
   - Quality Gate Status

---

### Exercise 2: Understanding Quality Gate Status

**Objective:** 
Learn to interpret the quality gate status for projects.

**Task**:
1. On the **Project List Page**, look at the **Quality Gate Status** column.
2. Identify which projects have passed or failed the quality gate.
3. Filter the projects to show only the ones that **failed** the quality gate.
4. Take note of any patterns in projects that are failing the quality gate. 
   Is it related to technical debt, bugs, vulnerabilities, or code smells?

---

### Exercise 3: Exploring Metrics Overview

**Objective:** 
Understand the key metrics displayed for each project on the main dashboard.

**Task**:
1. Review the **Metrics** section displayed in the **Project List Page**.
2. Identify the following metrics for at least five projects:
    - **Code Smells**
    - **Bugs**
    - **Vulnerabilities**
3. Use the **filter options** to find projects with the highest technical debt
   and take note of the overall trends in these projects.
4. Identify if there are any projects with a **high number of code smells** 
   or **bugs** and note their impact on the project.
