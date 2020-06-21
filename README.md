# README

# Task Management System ERD
![](https://i.imgur.com/usXXoHU.png)

# Model 

## User
<table>
   <tr>
      <th>Column</th> 
      <th>Type</th> 
   </tr>
   <tr>
      <td>user_id</td> 
      <td>int</td> 
   </tr>
   <tr>
      <td>name</td> 
      <td>string</td> 
   </tr>
    <tr>
      <td>email</td> 
      <td>string</td> 
   </tr>
   <tr>
     <td>password</td> 
     <td>string</td> 
   </tr>
   <tr>
    <td>role</td> 
    <td>string</td> 
   </tr>
</table>

## Task
<table>
   <tr>
      <th>Column</th> 
      <th>Type</th> 
   </tr>
   <tr>
      <td>task_id</td> 
      <td>int</td> 
   </tr>
  <tr>
     <td>title</td> 
     <td>string</td> 
  </tr>
  <tr>
     <td>description</td>
     <td>text</td>
  </tr>
  <tr>
     <td>start_at</td> 
     <td>datetime</td>
  </tr>
  <tr>
     <td>end_at</td> 
     <td>datetime</td>
  </tr>
  <tr>
     <td>status</td>
     <td>string</td>
  </tr>
  <tr>
     <td>priority</td>
     <td>string</td>
  </tr>
  <tr>
    <td>search_task</td>
    <td>string</td>
  </tr>
</table>


## Tag
<table>
   <tr>
      <th>Column</th> 
      <th>Type</th> 
   </tr>
   <tr>
     <td>tag_id</td> 
     <td>int</td> 
   </tr>
   <tr>
     <td>tag_name</td> 
     <td>string</td> 
  </tr>
  <tr>
    <td>search_tag</td>
    <td>string</td>
  </tr>
</table>  

## Task_Tag
<table>
   <tr>
      <th>Column</th> 
      <th>Type</th> 
   </tr>
   <tr>
     <td>task_tag_id</td> 
     <td>int</td> 
   </tr>
   <tr>
     <td>task_id</td> 
     <td>int</td> 
  </tr>
   <tr>
     <td>tag_id</td> 
     <td>int</td> 
  </tr>
</table> 
