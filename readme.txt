To install:

0 - Install git

1- Git clone https://github.com/ScoopInstaller/Scoop to downloads folder

4- Next, open "Powershell ISE (x86)" It must be this version or it will not work

6- Type "cd " then the unzipped folder's name (usually scoop-master) example: "cd Scoop"

7- Run these commands

Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
irm get.scoop.sh | iex

8- When the above script finishes running run this one

scoop install git # This is needed fordependencies

9- Then this one

scoop bucket add versions

10 - Copy G:\STEAM_INSTALL\steam.json

10- Then this one

scoop install steam

Finally, it should be installed

Note: Ignore all install requests or repair requests from steam because those require an admin password. After opening and closing the app a few times it will connect properly and let you install games.

Note 2: After the process is complete you can find Steam by hitting the windows key and typing Steam. If you did this correctly it will show up as an installed app.

Link to the original comment explaining this Here

Thank you to the deleted user who brought us this sacred knowledge




0 - Open "Powershell ISE (x86)" It must be this version or it will not work

1 - Install git

2- Git clone https://github.com/ScoopInstaller/Scoop to downloads folder

3- Type "cd " then the unzipped folder's name (usually scoop-master) example: "cd Scoop"

4- Run these commands

Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
irm get.scoop.sh | iex

5- When the above script finishes running run this one

scoop install git # This is needed fordependencies

6- Then this one

scoop bucket add versions

7 - Copy G:\STEAM_INSTALL\steam.json to C:\Users\kaba.kevin\scoop\buckets\versions\bucket and replace the exising steam.json

8 - Copy G:\STEAM_INSTALL\steam\steam.zip to C:\xampp\htdocs\steam

8- Then run this one

scoop install steam