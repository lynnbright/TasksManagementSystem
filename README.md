# README

# Task Management System ERD
![](https://i.imgur.com/5czjiZH.png)

# Model 

## User
<table>
   <tr>
      <td colspan="3">User</td>    
   </tr>
   <tr>
      <td>Column</td> 
      <td>Type</td> 
   </tr>
   <tr>
      <td>id</td> 
      <td>name</td> 
   </tr>
   <tr>
      <td>int</td> 
      <td>string</td> 
   </tr>
</table>

## Task
<table>
   <tr>
      <td colspan="2">Task</td>    
   </tr>
   <tr>
      <td>Column</td> 
      <td>Type</td> 
   </tr>
   <tr>
      <td>id</td> 
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
</table>


## Tag
<table>
   <tr>
      <td colspan="2">Tag</td>    
   </tr>
   <tr>
      <td>Column</td> 
      <td>Type</td> 
   </tr>
   <tr>
     <td>id</td> 
     <td>int</td> 
   </tr>
   <tr>
     <td>tag_name</td> 
     <td>string</td> 
  </tr>
</table>  

## Task_Tag
<table>
   <tr>
      <td colspan="2">Task_Tag</td>    
   </tr>
   <tr>
      <td>Column</td> 
      <td>Type</td> 
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
