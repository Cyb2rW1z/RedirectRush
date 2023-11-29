# RedirectRush

RedirectRush is a simple command-line tool designed to identify potential open redirect vulnerabilities in a list of URLs. Open redirects occur when a web application redirects a user to a destination specified by user-supplied input, making it a potential vector for phishing attacks.

The tool uses a bash script (openredirect.sh) to iterate through a list of URLs (real) and checks if the redirects contain specific patterns indicative of a potential security risk, such as redirecting to a domain with "evil.com" in the location or host headers. When a potential open redirect is detected, the tool prints a message indicating the URL where the vulnerability was found.
## Usage
```
git clone https://github.com/your-username/RedirectRush.git
cd RedirectRush
```
Make sure the openredirect.sh script has executable permissions:
```
chmod +x openredirect.sh
```
Create a file named real containing a list of URLs to be checked for open redirects.

Run the tool
```
./openredirect.sh
```
The tool will analyze each URL in the real file and report potential open redirects.

## Customization

You can customize the script to fit your needs. For example, you may want to modify the script to log the findings or integrate it into an automated testing pipeline. Feel free to adapt the script based on your specific requirements.



# My method to make this script work.

First i need to have file contains parameters.
i usually use paramspider and arjun to get the parameters

# command
```
paramspider -d {the domain}
```
if you want to download paramspider here. 
https://github.com/devanshbatham/ParamSpider

and after that the tool will generate folder named results/{domain-name.txt} with file for the domain contains params.

after that i usually sed the word FUZZ to make it work perfectly. 
```
cat results/{domain-name.txt} | grep "redirect_url" | sed -e 's/FUZZ//' | tee real
```
this command will delete the word `FUZZ` on the parameters called `redirect_url` and will store it in file  named real after that you just run RedirectRush.


Thats it !
