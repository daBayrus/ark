*WARNING*: This document is a combination of business and technical ideas.

# Project Ark

ark - Act of Random Kindness

# Problem

Everyone, in one way or another, wants to help improve our country and address the many social problems plaguing us. Many have ideas to solve specific problems but lack the resources and help to execute those ideas. While a greater number are waiting for activities that interest them and to which they can help. Project Ark wants to connect people with ideas and determination to people with resource and desire to help.

As a web-based application, it allows projects to get funded and and to accept volunteers. As an organization, we help in the execution of the project and ensure transparency and accountability in the use of donor money.

## Guiding Principle: Ideas worth doing.

## Design/Implementation Guides

* Integrate facebook and twitter from the very beginning - login, like, sharing, commenting. 
* It should be easy for leaders to update donors on the progress of the project or to say "Thank You".
* Transparency. As an organization, we must ensure donations are not misused and accountability and transparency are enforced.

## People

* *Donor*. Someone who gives money.  Every donor can have her own donor page that list all projects she funded.
* *Group*. A group could be a corporation or a non-profit that endorses projects. For example, Google will have a page (much like the donor page) 
  that list 20 projects. Google employees can then choose from the page what projects to give to.  The group page will show who are the top donors.
* *Leader*. Someone who has an idea that needs funding and volunteers.
* *Volunteer*. Someone who volunteers to help execute the project. For example, in a scholarship project, the volunteer can help in buying the materials, or a volunteer can help in documenting the progress.
* *Moderators*. Authorized website user that flags if projects are inappropriate.

## Use cases

*Registering a user*. User can register and login using their Facebook or Twitter account. Actually, there is no registration page. Just ask the user to login via Facebook or Twitter. Sharing a project or making a pledge does not need logging-in though.

*Start a project* Registered users start a project.  A project requires a name, amount of money needed, deadline, and detailed description. Project can also have a number of attachments (e.g. PDF of cost breakdown), images, and videos to help convince donors. Video will be the primary way of presenting an idea. If the project has no video presentation after 1 month of creating the project, the project will be flagged as incomplete.

Design notes: Projects are presented like a gallery of videos

Design notes: “Start a project” and “Pledge” are primary actions in the app. These buttons are included even if the user is not registered. If the user clicks on the button, we check if the user is registered or not. If not registered, we ask for Facebook registration.

Note: We deduct a 5% to the project cost to cover credit card transaction fees, etc. Project leaders should be made aware of this when they are estimating project cost. Donors should also be informed of this arrangement.

*Give a pledge*. The user can pledge amount not less than $5.  The list is presented as $5, $10, $20, and an input box (for other amounts). In the  pledge page, there is a clear explanation that “this is just a pledge and that no money will be deducted yet. When the project meets its target amount, we will notify you for collection.”  After clicking ‘Next’, the user is asked if they also want to donate to Project Ark. The amount is presented as  $2, $5 and an input box. Next, the user is asked if she wants to post to her wall “the support for this project X”.

*Collect pledges*. 

* When the project has met 50% of its target funding, we notify all pledgers of the status and ask if they want to pleadge additional money for the project.
* 100% of funding. We notify all pledgers that we are now going to collect their pleadge of amount of $x. If they also donated to project ark, we will also include that amount as separate item (but in the credit card charge, it can just be 1 transaction). After charging their credit card, we will send an email receipt. [Does this mean we have to be legally registered as non-profit]?
* Deadline comes, < 100% funding. We will inform project leader if she wants to extend the project. If they extend the project,  we will notify all pledgers if they want to continue with their pledge. Pledgers can choose to continue with the project, cancel the project, or give pledge to ark and let us choose project for them.

*Share project*. Facebook or Twitter button that posts the link to the current page to facebook or twitter.

*Moderate a project*. Some registered users will have capability to flag as inappropriate projects created. All flagged projects will not appear in the public listings. The project leader will not be notified the project is flagged but he can see the status when she logs in.

When flagging, the moderators must include a reason why the projects was flagged.  All moderators can see the reasons for flagging.

*Joining as volunteer*. A registered user can join a project as a volunteer. The leader can view the volunteer’s name and email. It should be set in the project if it is looking for money and/or volunteers.

Group-related cases are for further discussions.

## Relevant Pages

* Donor/User page. List of projects the donor supported and volunteered.
* Group page. List of projects the group supported.
* Project page. About the project, status, list of donors, and supporters.


## Stages

*Discover*. Are we solving a meaningful problem? 

* Find people willing to become member of advisory board. (See if strangers are willing to lend a hand)
* Launch page explaining our goal with video and presentation, with facebook like. (See if worth sharing)

*Validation*. Are people interested?

* Find 1 corporate group for launch.
* Find 10 non-profits start projects.
* Are donors and leaders comfortable with 5% donation?

*Efficiency*. Is our business model sustainable and repeatable?

* Charge corporate accounts?
* Markup of 5% on all projects with donor option to shoulder markup? For example, every time a donor pledges, ask if they can also pledge $1 (to help Project Ark)

*Scale*. How can we get more people involve?


## Assumptions

* Video is more effective than text+images in convinving people to pledge.
* People are willing to share socio-civic projects. When are they more willing to share (with or without a pledge)?
* What is the minimum amount people are willing to pledge? How can we increase the pledges?


## MVP's

### *Validate pledges*.

#### Assumption

Video is more effective than text+images in convinving people to pledge.

#### Features

* Start with 3 projects. 
* No need to create a UI for adding a project. All projects will be manually added.
* Pledge requires a Facebook login.
* Pledges are in 50, 100, and empty field (all in pesos). Make a note that the money will be collected only if pledges meet project `goal. 
* A page listing all the projects (no browsing, no search).
* Each project page will include the videos, images, and description.
* A page explaining what we are building.

#### Schedule

1st week of November.

### Metrics

* Visits x pledges


## Risks

### Business Risks

* Project leaders and donors will be turned-off by the 5% markup.
* Payment gateway surchage becomes prohibited.
* How can we ensure transparency and accountability? What to do if there is fund misuse?

### Technical Risks

* Security
* Spam projects

## Components
* Pledge. Tracking of pledges, collection, followups, and receipts.
* Social Network. Integration with facebook and twitter.


## Random Ideas

* Aside from starting a project, how about posting problems, getting suggestions, and the most voted suggestion can be promoted to the community project.
* Posting projects that need a "Leader".
