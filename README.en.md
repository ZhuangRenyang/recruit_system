# recruit_system

Graduation Design: Recruitment System

#### Software Architecture
Adopt front and rear end separation technology
Front end uses vue+ElementUI
Back end: SSM framework and spring boot technology stack
Persistence layer: MySql
Redis implements scheduled tasks
Use Websocket to realize front-end real-time communication

#### Installation

1.  web: 
        npm install
        npm run eval
2.  server:
        import modules
        Start database environment: database version 8.0+
        start Redis server

### `update logs`:

#### 2022.10.5 / v0.1.8
> The new homepage displays epidemic data. It is convenient for applicants to go to the interview when they are looking for jobs

#### 2022.10.5 / v0.1.7
>Add post routing guards to optimize the implementation of page title changes
>
>Connect the robot in the chat room to the API interface of Xiaoai to realize automatic reply
>
>Exception caused by saving messages with robots to the database during optimized chat
>
>Exceptional bugs caused by space characters when optimizing the request robot api

#### 2022.10.5 / v0.1.6
>After adding and viewing unread messages, modify the status of the message to read, and the red dot disappears
>
>When adding a new login, if there are unread messages, execute the message prompt in the window, and click to jump to the chat page
>
>Delete the position list data in the carousel map
>
>Fix bugs that can't be clicked in the friend chain
>
>Optimize redundant code
>
>When repairing the position, the corresponding province cannot be displayed
>
>Modify the master page layout,

#### 2022.10.4 / v0.1.5
>Fix the bug of abnormal avatar acquisition when sending chat content
>
>Modify the connection method to connect to the chat server (ws) as a profile item
>>>>>>> 2df4bb0 (v0.1.8更新)
