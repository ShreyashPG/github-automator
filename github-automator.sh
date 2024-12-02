# #!/bin/bash

# # GitHub API URL
# API_URL="https://api.github.com"

# # GitHub username and personal access token
# USERNAME=$username
# TOKEN=$token

# # User and Repository information
# REPO_OWNER=$1
# REPO_NAME=$2

# # Function to make a GET request to the GitHub API
# function github_api_get {
#     local endpoint="$1"
#     local url="${API_URL}/${endpoint}"

#     # Send a GET request to the GitHub API with authentication
#     curl -s -u "${USERNAME}:${TOKEN}" "$url"
# }

# # Function to list users with read access to the repository
# function list_users_with_read_access {
#     local endpoint="repos/${REPO_OWNER}/${REPO_NAME}/collaborators"

#     # Fetch the list of collaborators on the repository
#     collaborators="$(github_api_get "$endpoint" | jq -r '.[] | select(.permissions.pull == true) | .login')"

#     # Display the list of collaborators with read access
#     if [[ -z "$collaborators" ]]; then
#         echo "No users with read access found for ${REPO_OWNER}/${REPO_NAME}."
#     else
#         echo "Users with read access to ${REPO_OWNER}/${REPO_NAME}:"
#         echo "$collaborators"
#     fi
# }

# # Main script

# echo "Listing users with read access to ${REPO_OWNER}/${REPO_NAME}..."
# list_users_with_read_access
#!/bin/bash

# GitHub API URL
API_URL="https://api.github.com"

# GitHub username and personal access token (prompt user for input)
echo -e "\033[1;34mEnter your GitHub username:\033[0m"
read -r USERNAME
echo -e "\033[1;34mEnter your GitHub personal access token:\033[0m"
read -rs TOKEN
echo ""

# Function to add color
function print_color {
    local color="$1"
    local message="$2"
    echo -e "${color}${message}\033[0m"
}

# Function to make a GET request to the GitHub API with error handling
function github_api_get {
    local endpoint="$1"
    local url="${API_URL}/${endpoint}"
    
    response=$(curl -s -u "${USERNAME}:${TOKEN}" -w "%{http_code}" -o /tmp/github_api_response "$url")
    http_code=$(tail -n1 <<< "$response")
    body=$(< /tmp/github_api_response)

    if [[ "$http_code" -ge 400 ]]; then
        print_color "\033[1;31m" "Error: Unable to fetch data (HTTP Status: $http_code). Please check your inputs or authentication."
        return 1
    fi

    if [[ -z "$body" ]]; then
        print_color "\033[1;31m" "Error: Empty response received."
        return 1
    fi

    echo "$body"
}

# Function to prompt for repository owner and name
function prompt_repo_info {
    print_color "\033[1;36m" "Enter the repository owner:"
    read -r REPO_OWNER
    print_color "\033[1;36m" "Enter the repository name:"
    read -r REPO_NAME
}

# Function to handle errors and retries
function handle_errors {
    local func_name="$1"
    if ! "$func_name"; then
        print_color "\033[1;33m" "Would you like to retry? (y/n)"
        read -r retry
        if [[ "$retry" == "y" || "$retry" == "Y" ]]; then
            "$func_name"
        fi
    fi
}

# Individual functions for each task
function list_users_with_read_access {
    prompt_repo_info
    local endpoint="repos/${REPO_OWNER}/${REPO_NAME}/collaborators"
    collaborators=$(github_api_get "$endpoint" | jq -r '.[] | select(.permissions.pull == true) | .login')

    if [[ -z "$collaborators" ]]; then
        print_color "\033[1;31m" "No users with read access found for ${REPO_OWNER}/${REPO_NAME}."
    else
        print_color "\033[1;32m" "Users with read access to ${REPO_OWNER}/${REPO_NAME}:"
        echo "$collaborators"
    fi
}

function list_packages {
    prompt_repo_info
    local endpoint="repos/${REPO_OWNER}/${REPO_NAME}/packages"
    packages=$(github_api_get "$endpoint" | jq -r '.[] | .name')
    if [[ -z "$packages" ]]; then
        print_color "\033[1;31m" "No packages found in ${REPO_OWNER}/${REPO_NAME}."
    else
        print_color "\033[1;33m" "Packages in ${REPO_OWNER}/${REPO_NAME}:"
        echo "$packages"
    fi
}

function list_workflows {
    prompt_repo_info
    local endpoint="repos/${REPO_OWNER}/${REPO_NAME}/actions/workflows"
    workflows=$(github_api_get "$endpoint" | jq -r '.workflows[] | .name')
    if [[ -z "$workflows" ]]; then
        print_color "\033[1;31m" "No workflows found in ${REPO_OWNER}/${REPO_NAME}."
    else
        print_color "\033[1;33m" "Workflows in ${REPO_OWNER}/${REPO_NAME}:"
        echo "$workflows"
    fi
}

# Function to list projects in a repository
function list_projects {
    prompt_repo_info
    local endpoint="repos/${REPO_OWNER}/${REPO_NAME}/projects"
    projects=$(github_api_get "$endpoint" | jq -r '.[] | .name')

    if [[ -z "$projects" ]]; then
        print_color "\033[1;31m" "No projects found in ${REPO_OWNER}/${REPO_NAME}."
    else
        print_color "\033[1;33m" "Projects in ${REPO_OWNER}/${REPO_NAME}:"
        echo "$projects"
    fi
}


# Function to list discussions in a repository

function list_discussions {
  prompt_repo_info
  local endpoint="repos/${REPO_OWNER}/${REPO_NAME}/discussions"
  discussions=$(github_api_get "$endpoint" | jq -r '.[]? | .title')

  if [[ -z "$discussions" ]]; then
    print_color "\033[1;31m" "No discussions found in ${REPO_OWNER}/${REPO_NAME}."
  else
    print_color "\033[1;33m" "Discussions in ${REPO_OWNER}/${REPO_NAME}:"
    echo "$discussions"
  fi
}

# Function to list issues in a repository
function list_issues {
    prompt_repo_info
    local endpoint="repos/${REPO_OWNER}/${REPO_NAME}/issues"
    issues="$(github_api_get "$endpoint" | jq -r '.[] | .title')"
    print_color "\033[1;33m" "Issues in ${REPO_OWNER}/${REPO_NAME}:"
    echo "$issues"
}

# Function to list pull requests in a repository
function list_pull_requests {
    prompt_repo_info
    local endpoint="repos/${REPO_OWNER}/${REPO_NAME}/pulls"
    pull_requests="$(github_api_get "$endpoint" | jq -r '.[] | .title')"
    print_color "\033[1;33m" "Pull Requests in ${REPO_OWNER}/${REPO_NAME}:"
    echo "$pull_requests"
}

# Function to list actions in a repository
function list_actions {
    prompt_repo_info
    local endpoint="repos/${REPO_OWNER}/${REPO_NAME}/actions/runs"
    actions="$(github_api_get "$endpoint" | jq -r '.workflow_runs[] | .name')"
    print_color "\033[1;33m" "Actions in ${REPO_OWNER}/${REPO_NAME}:"
    echo "$actions"
}

# Menu loop
while true; do
    echo -e "\033[1;35mChoose an option:\033[0m"
    echo "1. List users with read access"
    echo "2. List packages"
    echo "3. List workflows"
    echo "4. List projects"
    echo "5. List discussions"
    echo "6. List issues"
    echo "7. List pull requests"
    echo "8. List actions"
    echo "9. Exit"
    
 read -rp "Enter your choice: " choice
    case $choice in
        1) handle_errors list_users_with_read_access ;;
        2) handle_errors list_packages ;;
        3) handle_errors list_workflows ;;
        4) handle_errors list_projects ;;
        5) handle_errors list_discussions ;;
        6) list_issues ;;
        7) list_pull_requests ;;
        8) list_actions ;;
        9) print_color "\033[1;34m" "Goodbye!"; exit 0 ;;
        *) print_color "\033[1;31m" "Invalid choice. Please try again." ;;
    esac
done
