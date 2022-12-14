#!/bin/bash

# Check if the -h option was provided to show the help section
if [ "$1" == "-h" ]; then
  echo ""
  echo -e "  \033[0;31mThis Email-Vulnerablity-Checker\e Was Created By \e[1;32mBLACK-SCORP10 \e"
  echo ""
  echo -e "\e[1;34m               For Any Queries Join Me!!!\e[0m"
  echo -e "\e[1;32m           Telegram: https://t.me/BLACK-SCORP10 \e[0m"
  echo ""
  echo ""
  echo "Usage: ./spfvuln.sh [-h] [-v] [-t targetfile] [-verbose] [domain]"
  echo "Check if a domain is vulnerable to email spoofing"
  echo ""
  echo "  -h              Show this help section"
  echo "  -v              Show the tool version"
  echo "  -t targetfile   Use a text file containing a list of domains to check"
  echo "  -verbose        Run the tool in verbose mode"
  echo "  domain          The domain to check (if not using the -t option)"
  echo ""
  echo "Examples: $ ./spfvuln.sh example.com"
  echo "	  $ ./spfvuln.sh -t targets.txt"
  echo "	  $ ./spfvuln.sh -t targets.txt -verbose"
  echo "	  $ ./spfvuln.sh example.com -verbose"
  echo ""
  exit 0
fi

# Check if the -v option was provided to show the tool version
if [ "$1" == "-v" ]; then
  echo "Email-Vulnerablity-checker v1.0.0"
  exit 0
fi

# Check if the -t option was provided to read from a target file
if [ "$1" == "-t" ]; then
  # Check if a target file was provided
  if [ -z "$2" ]; then
    echo "Error: No target file provided, use -h for help"
    exit 1
  fi

  # Check if the target file exists
  if [ ! -f "$2" ]; then
    echo "Error: Target file not found, use -h for help"
    exit 1
  fi

  # Read the domains from the target file
  while IFS= read -r domain; do
    # Check if the domain is valid using a regular expression
    if ! [[ $domain =~ ^([a-z0-9]+(-[a-z0-9]+)*\.)+[a-z]{2,}$ ]]; then
      echo "Error: Invalid domain '$domain'"
      continue
    fi

    # Check if the domain has a SPF record
    spf_record=$(dig +short TXT "$domain" | grep "v=spf1")
    if [ -z "$spf_record" ]; then
      # Check if the -verbose option was provided to show the SPF record
      if [ "$3" == "-verbose" ]; then
        echo "The domain '$domain' does not have a SPF record and is vulnerable to email spoofing"
        echo "SPF record: $spf_record"
      else
        echo "The domain '$domain' does not have a SPF record and is vulnerable to email spoofing"
      fi
    else
      # Check if the -verbose option was provided to show the SPF record
      if [ "$3" == "-verbose" ]; then
        echo "The domain '$domain' has a SPF record and is not vulnerable to email spoofing"
        echo "SPF record: $spf_record"
      else
        echo "The domain '$domain' has a SPF record and is not vulnerable to email spoofing"
      fi
    fi
  done < "$2"
else
  # Check if a domain was provided
  if [ -z "$1" ]; then
    echo "Error: No domain provided, use -h for help"
    exit 1
  fi

  # Check if the domain is valid using a regular expression
  if ! [[ $1 =~ ^([a-z0-9]+(-[a-z0-9]+)*\.)+[a-z]{2,}$ ]]; then
    echo "Error: Invalid domain '$1'"
    exit 1
  fi

  # Check if the domain has a SPF record
  spf_record=$(dig +short TXT "$1" | grep "v=spf1")
  if [ -z "$spf_record" ]; then
    # Check if the -verbose option was provided to show the SPF record
    if [ "$2" == "-verbose" ]; then
      echo "The domain '$1' does not have a SPF record and is vulnerable to email spoofing"
      echo "SPF record: $spf_record"
    else
      echo "The domain '$1' does not have a SPF record and is vulnerable to email spoofing"
    fi
  else
    # Check if the -verbose option was provided to show the SPF record
    if [ "$2" == "-verbose" ]; then
      echo "The domain '$1' has a SPF record and is not vulnerable to email spoofing"
      echo "SPF record: $spf_record"
    else
      echo "The domain '$1' has a SPF record and is not vulnerable to email spoofing"
    fi
  fi
fi

# This code is made and owned by BLACK-SCORP10.
# Feel free to contact me at https://t.me/BLACK-SCORP10
