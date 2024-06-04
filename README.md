# OptimumWindows
 A Script which tweaks windows for Optimal Performance

# Disable Hyper-V

The `DisableHyper-V.bat` script is designed to disable various Hyper-V features on Windows systems to potentially improve system performance or resolve compatibility issues. It requires administrative privileges to run and performs the following actions:
- Disables the Hypervisor feature.
- Disables the complete Hyper-V feature set.
- Disables Hyper-V GUI Management Tools.
- Disables Hyper-V Management Tools.
- Disables the Hyper-V Module for Windows PowerShell.

Each step checks if the feature is already disabled or not present, and provides appropriate feedback. The script ensures that all operations are executed with proper error handling and logs the outcome of each action. It is essential to run this script with administrative rights to ensure all commands can execute properly.
