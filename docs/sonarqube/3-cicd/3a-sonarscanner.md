# SonarScanner and Its Configuration

**SonarScanner** is a command-line tool used to analyze the source code of 
a project and send the analysis results to a SonarQube server. It is the 
primary mechanism through which SonarQube analyzes a project during 
Continuous Integration (CI) processes or local builds. SonarScanner is 
typically integrated with build tools like Maven, Gradle, or through direct 
command-line execution.     

## 1. What is SonarScanner?

SonarScanner is the official scanner used to send project analysis results 
to a SonarQube instance. It reads the source code, applies quality rules, 
and then reports back with information about bugs, vulnerabilities, code 
smells, and other quality metrics. SonarScanner can be used for different 
types of projects, including Java, C#, Python, JavaScript, and more.    

## 2. Types of SonarScanner

- **SonarScanner for Maven**: An integration for Maven-based projects. It 
  automatically integrates with Maven's lifecycle to trigger analysis. 
- **SonarScanner for Gradle**: Similar to the Maven version, it integrates 
  with Gradle-based projects to run analysis as part of the build. 
- **SonarScanner CLI**: The standalone version of SonarScanner that can be 
  run manually from the command line for various types of projects. 

## 3. SonarScanner Configuration

- **sonar-project.properties**: This is a key configuration file that 
  SonarScanner uses to gather information about the project. It includes 
  properties such as the project key, name, and SonarQube server URL.   
- **Environment Variables**: Some properties can be configured using 
  environment variables. For example, the `SONAR_HOST_URL` can be set to 
  point to your SonarQube server. 
- **Command Line Parameters**: When running SonarScanner from the CLI, you 
  can also provide configuration properties directly through command-line 
  flags. 

## 4. Common Configuration Properties
 
- `sonar.projectKey`: Unique identifier for the project.
- `sonar.projectName`: Name of the project.
- `sonar.projectVersion`: Version of the project.
- `sonar.sources`: Directory containing the source code to analyze.
- `sonar.host.url`: URL of the SonarQube server (e.g., `http://localhost:9000`)

## 5. Running SonarScanner

- **Maven**: `mvn sonar:sonar`
- **Gradle**: `gradle sonarqube`
- **CLI**: `sonar-scanner`

The scanner will analyze the project and send the results to the configured 
SonarQube server. 

---

## Exercises

### Exercise 1: Install and Configure SonarScanner

**Objective**: 
Learn how to install and configure SonarScanner for a project.

**Tasks**:
1. Install **SonarScanner** on your local machine.
2. Create a `sonar-project.properties` file in a sample project directory.
3. Set properties like `sonar.projectKey`, `sonar.projectName`, 
   and `sonar.sources` in the configuration file.
4. Run the SonarScanner using the appropriate command for your setup
   (e.g., `sonar-scanner` for CLI).

---

### Exercise 2: Run SonarScanner in CI/CD Pipeline

**Objective**: 
Integrate SonarScanner into a CI/CD pipeline.

**Tasks**:
1. Integrate **SonarScanner** into a simple CI pipeline using **Jenkins**, 
   **GitLab CI**, or **GitHub Actions**. 
2. Set up the SonarQube server URL and authentication token in the pipeline 
   configuration. 
3. Trigger a build and verify that the project is analyzed and results are 
   sent to SonarQube. 

---

### Exercise 3: Troubleshoot and Adjust Configuration

**Objective**: 
Practice troubleshooting and adjusting SonarScanner configurations.

**Tasks**:
1. Modify the `sonar-project.properties` file to configure additional 
   settings such as exclusions or specific rules. 
2. Run the scanner and inspect the logs for any errors or misconfigurations.
3. Adjust the configuration and re-run the scanner until the analysis 
   completes successfully. 
