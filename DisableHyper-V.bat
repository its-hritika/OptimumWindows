@echo off
:: Set color scheme
color 0A
title Disable Hyper-V by @its-hritika

fltmc >nul 2>&1 || (
    echo Administrator privileges are required.
    PowerShell Start -Verb RunAs '%0' 2> nul || (
        echo Right-click on the script and select "Run as administrator".
        pause & exit 1
    )
    exit 0
)
:: Initialize environment
setlocal EnableExtensions DisableDelayedExpansion

:: ----------------------------------------------------------
:: ----------------Disable "Hypervisor" feature-----------------
:: ----------------------------------------------------------
echo --- Disable "Hypervisor" feature
bcdedit /set hypervisorlaunchtype off
echo.
Disable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-Hypervisor
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------------Disable "Hyper-V" feature-----------------
:: ----------------------------------------------------------
echo --- Disable "Hyper-V" feature
:: Disable the "Microsoft-Hyper-V-All" feature
PowerShell -ExecutionPolicy Unrestricted -Command "$featureName = 'Microsoft-Hyper-V-All'; $feature = Get-WindowsOptionalFeature -FeatureName "^""$featureName"^"" -Online -ErrorAction Stop; if (-Not $feature) {; Write-Output "^""Skipping: The feature `"^""$featureName`"^"" is not found. No action required."^""; Exit 0; }; if ($feature.State -eq [Microsoft.Dism.Commands.FeatureState]::Disabled) {; Write-Output "^""Skipping: The feature `"^""$featureName`"^"" is already disabled. No action required."^""; Exit 0; }; try {; Write-Host "^""Disabling feature: `"^""$featureName`"^""."^""; Disable-WindowsOptionalFeature -FeatureName "^""$featureName"^"" -Online -NoRestart -LogLevel ([Microsoft.Dism.Commands.LogLevel]::Errors) -WarningAction SilentlyContinue -ErrorAction Stop | Out-Null; } catch {; Write-Error "^""Failed to disable the feature `"^""$featureName`"^"": $($_.Exception.Message)"^""; Exit 1; }; Write-Output "^""Successfully disabled the feature `"^""$featureName`"^""."^""; Exit 0"
dism /online /disable-feature /featurename:microsoft-hyper-v-all
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------Disable "Hyper-V GUI Management Tools" feature------
:: ----------------------------------------------------------
echo --- Disable "Hyper-V GUI Management Tools" feature
:: Disable the "Microsoft-Hyper-V-Management-Clients" feature
PowerShell -ExecutionPolicy Unrestricted -Command "$featureName = 'Microsoft-Hyper-V-Management-Clients'; $feature = Get-WindowsOptionalFeature -FeatureName "^""$featureName"^"" -Online -ErrorAction Stop; if (-Not $feature) {; Write-Output "^""Skipping: The feature `"^""$featureName`"^"" is not found. No action required."^""; Exit 0; }; if ($feature.State -eq [Microsoft.Dism.Commands.FeatureState]::Disabled) {; Write-Output "^""Skipping: The feature `"^""$featureName`"^"" is already disabled. No action required."^""; Exit 0; }; try {; Write-Host "^""Disabling feature: `"^""$featureName`"^""."^""; Disable-WindowsOptionalFeature -FeatureName "^""$featureName"^"" -Online -NoRestart -LogLevel ([Microsoft.Dism.Commands.LogLevel]::Errors) -WarningAction SilentlyContinue -ErrorAction Stop | Out-Null; } catch {; Write-Error "^""Failed to disable the feature `"^""$featureName`"^"": $($_.Exception.Message)"^""; Exit 1; }; Write-Output "^""Successfully disabled the feature `"^""$featureName`"^""."^""; Exit 0"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------Disable "Hyper-V Management Tools" feature--------
:: ----------------------------------------------------------
echo --- Disable "Hyper-V Management Tools" feature
:: Disable the "Microsoft-Hyper-V-Tools-All" feature
PowerShell -ExecutionPolicy Unrestricted -Command "$featureName = 'Microsoft-Hyper-V-Tools-All'; $feature = Get-WindowsOptionalFeature -FeatureName "^""$featureName"^"" -Online -ErrorAction Stop; if (-Not $feature) {; Write-Output "^""Skipping: The feature `"^""$featureName`"^"" is not found. No action required."^""; Exit 0; }; if ($feature.State -eq [Microsoft.Dism.Commands.FeatureState]::Disabled) {; Write-Output "^""Skipping: The feature `"^""$featureName`"^"" is already disabled. No action required."^""; Exit 0; }; try {; Write-Host "^""Disabling feature: `"^""$featureName`"^""."^""; Disable-WindowsOptionalFeature -FeatureName "^""$featureName"^"" -Online -NoRestart -LogLevel ([Microsoft.Dism.Commands.LogLevel]::Errors) -WarningAction SilentlyContinue -ErrorAction Stop | Out-Null; } catch {; Write-Error "^""Failed to disable the feature `"^""$featureName`"^"": $($_.Exception.Message)"^""; Exit 1; }; Write-Output "^""Successfully disabled the feature `"^""$featureName`"^""."^""; Exit 0"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -Disable "Hyper-V Module for Windows PowerShell" feature--
:: ----------------------------------------------------------
echo --- Disable "Hyper-V Module for Windows PowerShell" feature
:: Disable the "Microsoft-Hyper-V-Management-PowerShell" feature
PowerShell -ExecutionPolicy Unrestricted -Command "$featureName = 'Microsoft-Hyper-V-Management-PowerShell'; $feature = Get-WindowsOptionalFeature -FeatureName "^""$featureName"^"" -Online -ErrorAction Stop; if (-Not $feature) {; Write-Output "^""Skipping: The feature `"^""$featureName`"^"" is not found. No action required."^""; Exit 0; }; if ($feature.State -eq [Microsoft.Dism.Commands.FeatureState]::Disabled) {; Write-Output "^""Skipping: The feature `"^""$featureName`"^"" is already disabled. No action required."^""; Exit 0; }; try {; Write-Host "^""Disabling feature: `"^""$featureName`"^""."^""; Disable-WindowsOptionalFeature -FeatureName "^""$featureName"^"" -Online -NoRestart -LogLevel ([Microsoft.Dism.Commands.LogLevel]::Errors) -WarningAction SilentlyContinue -ErrorAction Stop | Out-Null; } catch {; Write-Error "^""Failed to disable the feature `"^""$featureName`"^"": $($_.Exception.Message)"^""; Exit 1; }; Write-Output "^""Successfully disabled the feature `"^""$featureName`"^""."^""; Exit 0"
:: ----------------------------------------------------------

:: ----------------------------------------------------------
:: -Disable "Hyper-V net Adapters" feature--
:: ----------------------------------------------------------
echo --- Disable "Hyper-V net adapters" feature
get-netadapter|where-object {$_.interfacedescription -like "*hyper-v*"}|Disable-NetAdapter

:: Pause the script to view the final state
pause
:: Restore previous environment settings
endlocal
:: Exit the script successfully
exit /b 0
