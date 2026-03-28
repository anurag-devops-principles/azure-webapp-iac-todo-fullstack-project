# Azure WebApp Todo Fullstack Application

A complete full-stack Todo application deployed to Azure Web App using Infrastructure as Code (IaC) with Terraform and automated CI/CD pipelines.

## Overview

This project demonstrates a modern DevOps approach to deploying a React-based Todo application on Azure. It features:

- **Frontend**: React application with Material-UI components
- **Backend**: External REST API service for task management
- **Infrastructure**: Azure Web App with automated provisioning via Terraform
- **CI/CD**: GitHub Actions with reusable workflow library integration
- **Security**: Automated dependency scanning and code quality checks

## Architecture

```
┌─────────────────┐    ┌──────────────────┐    ┌─────────────────┐
│   React Frontend│────│  Azure Web App   │────│  Backend API    │
│   (TodoApp)     │    │  (Linux)         │    │  (External)     │
└─────────────────┘    └──────────────────┘    └─────────────────┘
                              │
                              ▼
                       ┌─────────────────┐
                       │   Terraform     │
                       │ Infrastructure  │
                       └─────────────────┘
```

### Components

- **Frontend Application**: Single-page React app with task CRUD operations
- **Azure Infrastructure**: Resource Group, App Service Plan, and Linux Web App
- **Backend Service**: REST API hosted externally (52.146.33.135:8000)
- **CI/CD Pipeline**: Automated build, test, and deployment workflows

## Technology Stack

### Frontend
- **React 18.2.0** - Modern JavaScript library for building user interfaces
- **Material-UI (MUI)** - React components implementing Google's Material Design
- **Axios** - HTTP client for API communication
- **React Testing Library** - Testing utilities for React components

### Infrastructure
- **Terraform** - Infrastructure as Code tool
- **Azure Resource Manager** - Cloud resource provisioning
- **Azure Web App** - Platform as a Service (PaaS) for web applications

### DevOps & CI/CD
- **GitHub Actions** - CI/CD platform
- **Reusable Workflows** - Modular pipeline components from shared library
- **RetireJS** - Dependency vulnerability scanning
- **Biome** - Fast JavaScript/TypeScript linter and formatter

## Project Structure

```
azure-webapp-iac-todo-fullstack-project/
├── frontend/                          # React application
│   ├── public/                        # Static assets
│   ├── src/                          # Source code
│   │   ├── App.js                    # Main application component
│   │   ├── TodoApp.js                # Todo application logic
│   │   └── ...                       # Other React components
│   ├── package.json                  # Node.js dependencies
│   └── README.md                     # Frontend documentation
├── terraform/                        # Infrastructure as Code
│   ├── environment/                  # Environment-specific config
│   │   ├── main.tf                   # Main infrastructure definition
│   │   ├── variables.tf              # Input variables
│   │   ├── terraform.tfvars          # Variable values
│   │   ├── outputs.tf                # Output values
│   │   ├── locals.tf                 # Local values and tags
│   │   ├── provider.tf               # Azure provider config
│   │   └── backend.tf                # Remote state configuration
│   └── modules/                      # Reusable Terraform modules
│       ├── azurerm_resource_group/   # Resource group module
│       ├── azurerm_service_plan/     # App service plan module
│       └── azurerm_linux_web_app/    # Web app module
├── .github/workflows/                # GitHub Actions CI/CD
│   ├── build-N-deploy.yaml           # Main deployment pipeline
│   ├── terraformWorkflow.yaml        # Infrastructure provisioning
│   └── terraformDestroy.yaml         # Infrastructure cleanup
├── LICENSE                           # Apache License 2.0
└── README.md                         # This file
```

## Infrastructure Details

### Azure Resources

The Terraform configuration creates the following Azure resources:

| Resource | Purpose | Configuration |
|----------|---------|---------------|
| **Resource Group** | Logical container for resources | `dev-practice-rg` |
| **App Service Plan** | Hosting plan for web apps | Free tier (F1), Linux |
| **Linux Web App** | Web application hosting | `dev-practice-application` |

### Terraform Modules

The infrastructure is organized into reusable modules:

- **`azurerm_resource_group`**: Manages Azure resource groups with consistent tagging
- **`azurerm_service_plan`**: Configures App Service Plans with OS and SKU settings
- **`azurerm_linux_web_app`**: Deploys Linux web applications with custom settings

### Configuration

Key configuration values (defined in `terraform/environment/`):

```hcl
# Environment settings
environment = "dev"
application = "practice"
location    = "central india"

# App Service Plan
os_type  = "Linux"
sku_name = "F1"  # Free tier

# Web App settings
always_on = false
https_only = true
```

## CI/CD Pipeline

The project uses GitHub Actions with reusable workflows from a shared library:

### Pipeline Stages

1. **Security Scanning** - RetireJS dependency vulnerability analysis
2. **Code Quality** - Biome linting and formatting checks
3. **Build & Package** - NPM build and artifact generation
4. **Deploy** - Azure Web App deployment (manual trigger)

### Workflow Triggers

- **Manual Deployment**: `workflow_dispatch` with deployment confirmation
- **Infrastructure**: Separate workflows for provisioning and cleanup

### Reusable Workflows

The pipelines leverage reusable workflows from:
```
anurag-devops-principles/devops-cicd-workflows-pipeline-library
```

This approach ensures:
- **Consistency** across multiple projects
- **Maintainability** through centralized workflow management
- **Security** with standardized scanning and validation

## Prerequisites

### Development Environment
- **Node.js** 16.x or later
- **npm** or **yarn** package manager
- **Git** for version control

### Azure Requirements
- **Azure Subscription** with appropriate permissions
- **Azure CLI** installed and authenticated (`az login`)
- **Service Principal** (optional, for automated deployments)

### Terraform Requirements
- **Terraform** v1.0+ installed
- **Azure Provider** configured with subscription access

## Setup and Deployment

### Local Development

1. **Clone the repository**:
   ```bash
   git clone https://github.com/anurag-devops-principles/azure-webapp-iac-todo-fullstack-project.git
   cd azure-webapp-iac-todo-fullstack-project
   ```

2. **Install frontend dependencies**:
   ```bash
   cd frontend
   npm install
   ```

3. **Start development server**:
   ```bash
   npm start
   ```
   The application will be available at `http://localhost:3000`

### Infrastructure Deployment

1. **Navigate to Terraform directory**:
   ```bash
   cd terraform/environment
   ```

2. **Initialize Terraform**:
   ```bash
   terraform init
   ```

3. **Plan deployment**:
   ```bash
   terraform plan
   ```

4. **Apply infrastructure**:
   ```bash
   terraform apply
   ```

### CI/CD Deployment

The application deploys automatically via GitHub Actions:

1. **Trigger deployment** from GitHub Actions tab
2. **Confirm deployment** when prompted
3. **Monitor progress** through workflow logs
4. **Access application** at the generated Azure Web App URL

## Application Features

### Todo Management
- ✅ **Create Tasks** - Add new tasks with title and description
- ✅ **View Tasks** - Display all tasks in a clean, organized list
- ✅ **Delete Tasks** - Remove completed or unwanted tasks
- ✅ **Real-time Updates** - Automatic UI refresh after operations

### User Interface
- 🎨 **Material Design** - Modern, responsive UI with Material-UI components
- 📱 **Responsive Layout** - Works on desktop and mobile devices
- 🎯 **Intuitive UX** - Simple, clean interface for task management

### API Integration
- 🔗 **RESTful API** - Communicates with backend via HTTP endpoints
- ⚡ **Axios Client** - Reliable HTTP client with error handling
- 🔄 **State Management** - React hooks for local state management

## Configuration

### Environment Variables

The application connects to a backend API. To modify the API endpoint:

1. Update `API_BASE_URL` in `frontend/src/TodoApp.js`:
   ```javascript
   const API_BASE_URL = 'https://your-api-endpoint.com';
   ```

2. For production deployments, consider using environment variables:
   ```javascript
   const API_BASE_URL = process.env.REACT_APP_API_URL || 'http://localhost:8000';
   ```

### Azure Web App Settings

Additional configuration can be added to `terraform.tfvars`:

```hcl
app_settings = {
  WEBSITE_RUN_FROM_PACKAGE = "1"
  WEBSITE_NODE_DEFAULT_VERSION = "16.14.0"
  # Add custom environment variables here
}
```

## Security Considerations

- **HTTPS Only**: Web App configured to enforce HTTPS connections
- **Dependency Scanning**: Automated vulnerability checks with RetireJS
- **Code Quality**: Linting and formatting validation with Biome
- **Access Control**: Azure RBAC for infrastructure management

## Monitoring and Maintenance

### Application Monitoring
- Azure Application Insights integration available
- Web App logs accessible via Azure Portal
- Performance metrics and error tracking

### Infrastructure Monitoring
- Azure Monitor for resource health
- Terraform state management for configuration drift detection
- Cost monitoring and optimization

## Troubleshooting

### Common Issues

**Build Failures**:
- Check Node.js version compatibility
- Verify all dependencies are installed
- Review build logs for specific errors

**Deployment Issues**:
- Confirm Azure authentication is valid
- Check resource quotas and limits
- Verify app service plan capacity

**API Connection Problems**:
- Ensure backend service is accessible
- Check CORS configuration if needed
- Verify API endpoint URLs

### Logs and Debugging

- **GitHub Actions**: View workflow logs in Actions tab
- **Azure Web App**: Access logs via Azure Portal → Web App → Log Stream
- **Terraform**: Use `terraform plan` and `terraform apply -auto-approve` for debugging

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Development Guidelines

- Follow React best practices and Material-UI guidelines
- Write meaningful commit messages
- Test changes locally before submitting PRs
- Update documentation for significant changes

## License

This project is licensed under the Apache License 2.0 - see the [LICENSE](LICENSE) file for details.

**Note**: This project demonstrates DevOps best practices for modern web application deployment on Azure, including Infrastructure as Code, automated testing, and continuous deployment.

**Author**: Anurag Vijay
