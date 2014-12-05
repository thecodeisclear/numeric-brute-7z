Numeric Brute Force Password Cracker for 7zip
================

Windows batch script that does a brute force numeric password crack for an archive using 7zip.

## Instructions

First and foremost, you need 7zip for this. If you don't have 7zip installed, you can get the portable version
- Copy numbrute.bat to the same folder as your archive (can be any extension that 7zip supports)
- Copy filesize.bat as-is to the same folder
- Change the name of the archive ```set archive=<your-file-here>```
- Change the name of the sample file to extract ```set file2xtr=<file-from-archive-here>```
- Change the range for the numeric check. For e.g., if you want to try all four digit numbers you can change strtNum to 1000 and endNum to 9999
- Shift & Right click the folder with the archive and select ```Open command window Here```
- Run numbrute. The batch file will run till it is able to extract successfully
- The password will be displayed on the screen
 
## FAQs
**Q:** Error "'7z' is not recognized as an internal or external command, operable program or batch file."

**A:** You don't have 7zip installed or the path to 7zip is not setup correctly. Check the value of the PATH variable in the code. You will need to change the value I have provided with the path to 7z.exe (this example is from 7zip Portable)
```
set PATH=D:\Prog\7z\App\7-Zip;%PATH%
```

**Q:** The password provided does not work

**A:** I noticed a similar error with zip files. In some cases, inspite of a wrong password, the resultant file is non-empty. The filesize would be a < 100 bytes and would be junk characters. To prevent such false positives, you can make the following changes
* Open filesize.bat and change the line ```set minbytesize=0``` to a different number closer (and yet lesser) to the actual filesize. 
* If the sample file you are extracting is a small one (such as a readme.txt), choose a different file that is greater than 10KB

## Support
If you need any help in executing this or want to modify this, you can either raise an issue on github or drop a note at my website [Reach Out] (http://thecodeisclear.in/reach-out/)

Details of how this script evolved can be found here [Brute Force Algorithm for numeric password protected archives] (http://thecodeisclear.in/brute-force-algorithm-for-numeric-password-protected-archives/)
