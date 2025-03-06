# Steam Without Privilege Escalation

This script automates the installation of Steam on Windows computers, specifically designed to run Steam without requiring administrative privileges. It is ideal for situations like using school or work computers where admin rights are restricted. The process allows you to install and run Steam without needing to escalate privileges, making it perfect for accessing Steam on computers that otherwise wouldn't allow it.

##Before you rn the code if you get an error about certificates just run this 
'''Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force'''

## How It Works

1. **Install Git (via Winget):**  
   The script checks if Git is installed, and if not, it uses `winget` to install it in a separate PowerShell window.

2. **Clone Scoop Repository:**  
   The script clones the Scoop repository to `C:\Scoop` to install Scoop, a command-line installer for Windows.

3. **Install Scoop:**  
   If Scoop is already installed, the script will update it. Otherwise, it installs Scoop and sets the necessary execution policy for scripts.

4. **Install Git via Scoop:**  
   Git is installed via Scoop, which helps keep installations clean and easy to manage.

5. **Add Scoop Versions Bucket:**  
   The script adds the `versions` bucket in Scoop to access different versions of software packages, including Steam.

6. **Copy Steam Files:**  
   The script copies necessary Steam files (like `steam.json` and `steam.zip`) from a predefined source to the required XAMPP directory, making sure the installation is ready to run.

7. **Start XAMPP:**  
   The script starts the XAMPP control panel, which is used to manage local servers like Apache, which Steam can run on.

8. **Install Steam via Scoop:**  
   Finally, the script installs Steam using Scoop, ensuring the process remains non-intrusive and avoids the need for elevated privileges.

## Benefits

- **No Administrative Privileges:**  
  You don't need to be an administrator on the machine to install and run Steam.
  
- **Ideal for Restricted Environments:**  
  Perfect for use on school or work computers where administrative rights are not available.

- **Portable & Easy to Use:**  
  The script is simple to run and doesn't require complex configuration, making it easy to use in any environment.

## Prerequisites

- **PowerShell ISE (x86):**  
  Make sure to run the script using PowerShell ISE (x86) for compatibility.
  
- **XAMPP:**  
  You need to have XAMPP installed for managing the local server.

## Usage

1. Download the repository and open the PowerShell ISE (x86).
2. Run the script. It will install all dependencies and start XAMPP.
3. Once completed, you can open Steam and play your games!

## License

This project is licensed under the MIT License.
