# acme_corp
##  Description of Project
A Flutter based project Assesment meant to Test how one tackles Authentication & CRUD operations.
###  Project Overview
Acme corp is a company that helps other organizations to handle customer care requests. They sustain a call center with agents who receive customer calls, emails and chats from SMS and Whatsapp. 
Each agent on receiving a request, logs the request against each customer's profile and attempts to find a solution or advise them accordingly. Customers will need to know that their case has been logged by way of e-mail communication or any other available means. Importantly, a ticket number is generated, title of request, description and categorization of request; optionally attachments may be added. Follow-up comments may be logged against the ticket, sorted in reverse chronological order on opening the ticket. The tickets have dispositions according to the workflow; such as OPEN, IN PROGRESS, BLOCKED, RESOLVED, RE-OPENED and CLOSED Customers may log in to the interface to check the tickets they have raised and add comments, resolve if satisfied and or re-open if their concerns are not conclusively handled 
Acme corp needs a simple dashboard to understand the performance of the agents; such as how many tickets are in progress, closed etc 

### Tech Stack
- Flutter (Dart) for the frontend 
- Firebase for the backend

### Features
- Agents to login/logout 
- Agents to create, view and update a customer profile 
- Agents to log a ticket with the right status, add title, description, attachment, comments 
- Agents to transition a ticket to any of the dispositions described 
- Customer to login and view their tickets with ability to comment on them or transition according to their satisfaction 


### Installation
- Clone the repo
-  Run `flutter pub get` to install all dependencies
-  Run `flutter run` to run the app


### Documentation
- [Acme Corp Documentation](./docs/use-cases.md)
-  The documentation shows the User Stories, Use Case Diagram, State Transition Chart, UI Designs & Wireframes for the project .