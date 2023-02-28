# *** Settings ***
# Resource        Calc_keywords.resource

# *** Test Cases ***
# Test Calculator With BDD Syntax
#     Given The Calculator Is Running
#     When The User Enters The Term "1 + 1"
#     And The User Triggers The Calculation
#     Then The Result Should Be "2"



# *** Settings ***
# Documentation     A test suite for valid login.
# ...
# ...               Keywords are imported from the resource file
# Resource          keywords.resource
# Default Tags      positive

# *** Test Cases ***
# Login User with Password
#     Connect to Server
#     Login User            ironman    1234567890
#     Verify Valid Login    Tony Stark
#     [Teardown]    Close Server Connection

# Denied Login with Wrong Password
#     [Tags]    negative
#     Connect to Server
#     Run Keyword And Expect Error    *Invalid Password    Login User    ironman    123
#     Verify Unauthorised Access
#     [Teardown]    Close Server Connection

*** Settings ***
Documentation     This .robot file is a suite
...
...               Keywords are imported from the resource file
Resource          keywords.resource
Library           DateTime


*** Test Cases ***
Simple Test Case
    [Documentation]    Shows some assertion keywords
    # Should Be Title Case    Robot Framework
    Should Be Equal    Text123    Text123
    Should Be True    5 + 5 == 10

Test with Keywords
    Store Text    Hail Our Robot
    Add Text To Stored Text     Overlords!
    Verify Stored Text Length    25
    ${current_text}=    Get Stored Text
    Should Be Equal    ${current_text}    Hail Our Robot Overlords!

Test for the year 2022
    [Documentation]    Tests if it is still 2022...
    ${date}=    Get Current Date    result_format=datetime
    Log    ${date}
    Should Be Equal As Strings    ${date.year}    2022

Test Case that fails
    Check Correct Greeting    Hail Our Robot Overlords!
    Check Correct Greeting    Hello World!
