# SAM
SSH Accounts Manager (SAM) is a bash scripts that helps you manage credentials and easily login to multiple ssh accounts 

**How to USE:**
1. Download `bash.sh` script and open it in an editor e.g `nano bash.sh`
2. Add your ssh account details as an arry for each account and assign it to a new variable:
      `exampleAccount=("localServer"  "127.0.0.1"  "root"  "22"   "/file/key")`
      First item in the array is an optional name for the ssh credentials,
      Second is Ip/Host
      Third is SSH user
      Fourth is SSH Port (optional)
      Fifth is the key file (optional)
3. Then add each of above server variable as item to MAIN_ARRAY below e.g `exampleAccount[@]`
`MAIN_ARRAY=(`
      `  exampleAccount[@]`
      `  exampleAccount2[@]`
      `  .`
      `  .`
      `  .`
      `)`
4. Run the script whenever you need to login to an account `./bash.sh`   
