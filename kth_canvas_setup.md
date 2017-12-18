# Canvas Guides
Documentation regarding setup of Canvas testing environment

## Account Admin
**Account Admin** is an administrator of accounts (institutions) and sub-accounts (departments).

There is one account admin with the following login credentials:
```
- username: vagrant@example.com
- password: vagrant123
```

### Accounts and sub-accounts
**Account**: Top level account for an institution, i.e KTH

**Sub-account**: Lower level account for departments of institutions, i.e ICT

An **Account admin** can create accounts and sub-accounts. In this setup there are two (top-level) accounts:
- **KTH**
- **Site Admin**: can create users and assign logins to accounts.

Hierarchy starting from **Account Admin** and branching to accounts and sub-accounts:
```
Account Admin - vagrant@example.com
|
|__Site Admin
|
|__KTH
   |
   |__ICT
```

### User Creation
An **Account Admin** can create users and assign logins to specific accounts.
Users are people that interact with Canvas LMS via the UI. A **user** can be created by an *account admin* and he is mapped to an *account* , in our example KTH.

There are two users created by the **Account admin** of *Site Admin* account, the instructor and the student. Logins have been assigned to those users to account *KTH*.

Users:
- instructor@example.com
- student@example.com

**NOTE**: I have no idea how to correctly create users. So far, from Site admin account, I create the user and create login information for that user for KTH. Then that user dissappears from users of Site admin, and appears to users of KTH.

### Permition manipulation
There are set of permitions that are assigned to users, account_admins, according to roles.

- course role
	- Student, TA, Teacher, Designer, Observer
- account role
	- Account admin (for example KTH, Site Admin)

Each **sub-role** has a set of **permissions** depending on the level of access he has in different features of Canvas.

### Course manipulation
An **Account Admin** can create a course and place it under a specific sub-account (ICT). A teacher is assigned to a course. Students are assigned to a course.

After opening the Course Settings, in sections People, you can add a teacher and a student to a course.
