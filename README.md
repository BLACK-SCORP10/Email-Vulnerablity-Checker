<h1 align="center">
  <br>
  <a href=" https://github.com/BLACK-SCORP10/Email-Vulnerablity-Checker.git"><img src="img/EVC.png"></a>
  <br>
  Email Vulnerability Checker v2.0
  <br>
</h1>


<p align="center">Verify whether the domain is vulnerable to spoofing by Email-vulnerablity-checker</p>



## Features of Version 2.0

- Added Support to save output on a file using -o flag
- Added more checks that will accurately tell you the Vulnerability Status.
- Updated the code completely with proper and accurate results.
- Enhanced the tool and decorated some look and feel on the tool.


Email Vulnerability Checker

This script checks the SPF and DMARC configurations of email domains to determine their vulnerability status. It's useful for system administrators or security professionals to assess email infrastructure security.

## Usage

To run the script, execute it with the following command:

./spfvuln.sh [options]

### Options

- -h, --help: Display the help message.
- -v: Display the version of the script.
- -t <file>: Specify a file containing a list of domains to check.
- -d <domain>: Specify a single domain to check.
- -o <output.txt>: Specify an output file to save the results.

## Requirements

- Bash-compatible shell: Ensure your system supports Bash scripting.
- nslookup command: Make sure the nslookup command is installed and available in your system's PATH.

## Example Usage

1. Checking a single domain:

./spfvuln.sh -d example.com

2. Checking multiple domains from a file:

./spfvuln.sh -t domains.txt

3. Saving results to an output file:

./spfvuln.sh -d example.com -o output.txt

## Preview

<a href=" https://github.com/BLACK-SCORP10/Email-Vulnerablity-Checker.git"><img src="img/image.png"></a>

## Detail Description On Configurations Flag

SPF Configuration | DMARC Configuration | Vulnerability Status | Explanation
-------------------|----------------------|----------------------|---------------------------------------------------------------------------------------------------------------------------------------
-all               | Reject               | Not Vulnerable       | SPF (-all) with DMARC reject policy ensures that unauthorized emails are rejected outright, minimizing spoofing risks.
-all               | Quarantine           | Less Vulnerable      | SPF (-all) with DMARC quarantine policy sends unauthorized emails to spam or a designated folder, reducing risks.
-all               | None                 | Vulnerable           | SPF (-all) without DMARC leaves some vulnerability, as DMARC can enhance email authentication and alignment.
-all               | No Answer            | Vulnerable           | The presence of "redirect" or other mechanisms not explicitly defined can lead to vulnerabilities, depending on the redirected domain's SPF configuration.
~all               | Reject               | Less Vulnerable      | SPF soft fail (~all) with DMARC reject policy may allow unauthorized emails but rejects those failing DMARC alignment.
~all               | Quarantine           | More Vulnerable      | SPF soft fail (~all) with DMARC quarantine policy may allow unauthorized emails but sends them to spam or a designated folder.
~all               | None                 | Vulnerable           | SPF soft fail (~all) without DMARC leaves more vulnerability, as DMARC can enhance email authentication and alignment.
~all               | No Answer            | Vulnerable           | The presence of "redirect" or other mechanisms not explicitly defined can lead to vulnerabilities, depending on the redirected domain's SPF configuration.
+all               | Reject               | Vulnerable           | SPF pass (+all) with DMARC reject policy is vulnerable as it accepts all emails without proper authentication or alignment.
+all               | Quarantine           | More Vulnerable      | SPF pass (+all) with DMARC quarantine policy may allow all emails but sends unauthorized ones to spam or a designated folder.
+all               | None                 | Vulnerable           | SPF pass (+all) without DMARC leaves vulnerability, as DMARC can enhance email authentication and alignment.
+all               | No Answer            | Vulnerable           | The presence of "redirect" or other mechanisms not explicitly defined can lead to vulnerabilities, depending on the redirected domain's SPF configuration.
?all               | Reject               | Vulnerable           | SPF neutral (?all) with DMARC reject policy doesn't provide strong protection, potentially allowing unauthorized emails.
?all               | Quarantine           | More Vulnerable      | SPF neutral (?all) with DMARC quarantine policy may allow unauthorized emails but sends them to spam or a designated folder.
?all               | None                 | Vulnerable           | SPF neutral (?all) without DMARC leaves vulnerability, as DMARC can enhance email authentication and alignment.
?all               | No Answer            | Vulnerable           | The presence of "redirect" or other mechanisms not explicitly defined can lead to vulnerabilities, depending on the redirected domain's SPF configuration.
N/A                | Reject               | Vulnerable           | Without SPF, DMARC reject policy doesn't provide strong protection against unauthorized emails, potentially allowing spoofing and phishing.
N/A                | Quarantine           | More Vulnerable      | Without SPF, DMARC quarantine policy may allow unauthorized emails but sends them to spam or a designated folder.
N/A                | None                 | Highly Vulnerable    | Without SPF, DMARC none policy leaves the domain highly vulnerable to various email-based threats, including spoofing and phishing attacks.
N/A                | No Answer            | Highly Vulnerable    | The absence of both SPF and DMARC records leaves the domain highly vulnerable to various email-based threats, including spoofing and phishing attacks, especially if "redirect" or other mechanisms not explicitly defined are present.

Other types are Redirect Mechanism and Multiple SPF Flags. 
- On Redirect Mechanism, The DMARC redirects to another domain/subdomain for the policies that is used over the domains. Better to check it manually. 
- On Multiple SPF Flags, The SPF has more then one defined flags, "A domain must not have multiple SPF records as both will be declined by the recipient server, making the authentication impossible". You can report this. 

## Author

This Email Vulnerability Checker script was created by BLACK-SCORP10. For queries or feedback, contact the author via Telegram: BLACK-SCORP10.

## Version

Current version: 2.0

## Disclaimer

This script is provided as-is, Use it at your own risk. 

### Support

For Queries: [Telegram](https://t.me/BLACK_SCORP10)  
Contributions, issues, and feature requests are welcome!  
Give a ★ if you like this project!

### License
This project is licensed under the MIT License - see the LICENSE file for details.
