# Getting Started with RushJS

This project serves as an example to guide you through the initial steps of setting up a project using RushJS. Rush is a tool developed by Microsoft that manages monorepo projects, particularly well-suited for TypeScript projects with multiple packages.

## Prerequisites

Before you begin, ensure you have the following prerequisites:

- [Node.js](https://nodejs.org/) (LTS version recommended)
- [npm](https://www.npmjs.com/) or [Yarn](https://yarnpkg.com/)

Install Rush globally (if not already installed):

`npm install -g @microsoft/rush`

## Installation

1. Clone this repository: `git clone https://github.com/FociSolutions/rushjs-demo.git`

2. Install project dependencies: `rush update`


## Project Structure
`/common`: Shared code or libraries that multiple packages depend on.
`/apps`: Applications built on top of the common packages.
`/packages`: Independent packages that can be used in apps or other packages.


## Usage
Rush provides various commands for managing and building your monorepo. Common commands include:

`rush build`: Build the entire monorepo.
`rush rebuild`: Rebuild the monorepo.
`rush update`: Update dependencies and generate package-lock files.
`rush -h` : command-line help

Feel free to explore the [Rush documentation ](https://rushjs.io/pages/intro/get_started) for more details.

## Creating a New Package
To create a new package in this RushJS monorepo, you can start by copying an existing package as a template:

1. **Manually copy an existing package**
To create a new package in your Rush monorepo, you can copy an existing package as a starting point. For example, if you want to create a new package named "my-new-package," you can copy an existing package's directory and then customize it.


2. **Modify package.json**
In the newly copied package directory (e.g., packages/my-new-package), you should update the package.json file to reflect the details of your new package. Open the package.json file and make the necessary changes, including the package name, version, and any other metadata relevant to your new package.

3. **Customize the Package Code**
Modify the TypeScript code and any other files within the new package to implement your specific functionality. You can add or remove files and dependencies as needed.

4. **Update rush.json**
To include your new package in the Rush configuration, update the rush.json file located in the root of your monorepo. Add an entry for your new package under the projects section, specifying the package name, project folder, and version policy:
    ```json
        {
            "projects": [
                {
                "packageName": "@project/my-new-package",
                "projectFolder": "packages/my-new-package",
                "versionPolicyName": "your-version-policy-name"
                },
                // ... other projects
            ]
    }
    ```

Replace "my-new-package" with the name of your new package, and replace "your-version-policy-name" with the actual version policy you want to use.


5. Build and Test

After adding your new package, use Rush commands to build and test it. For example: 
```bash
rush update
rush rebuild
```


## Creating a New App
If you want to create a new app within this RushJS monorepo, a quick way to get started is by copying the existing sample Express.js app and making adjustments to suit your needs. Here's how you can do it:

1. **Copy the Sample Express App**
To create a new app, you can copy the sample express app located in the "apps" directory.


2. **Modify package.json**
Open the package.json file in the newly copied package directory (e.g., libraries/my-new-package) and update it with the details specific to your new package, including the package name, version, and other metadata.

3. **Customize the app code**
Implement your Apps's functionality by modifying the TypeScript code and any other relevant files within the new app. You can add or remove files and dependencies as needed.

4. **Update rush.json**
Include your new app in the Rush configuration by updating the rush.json file in the root of the monorepo. Add an entry for your new package under the projects section, specifying the package name, project folder, and version policy.
    ```json
    {
        "projects": [
            {
            "packageName": "@project/new-app",
            "projectFolder": "apps/new-app",
            "versionPolicyName": "your-version-policy-name"
            },
            // ... other projects
        ]
    }
    ```

## Running Tests with Heft (Powered by Jest)

In your RushJS monorepo, you can run tests using Heft, a tool designed for building and testing large TypeScript projects. It's worth noting that Heft utilizes Jest, a popular testing framework, for running tests. Here's how to run tests with Heft and Jest.

### Running Tests for a Specific Package or App

To run tests for a specific package or app within your monorepo using Heft, use the following command:

```bash
# Inside package / app directory
heft test 

heft test --to=path-my-package-or-app
```

Replace `path-my-package-or-app` with the actual name of the package or app you want to test.

