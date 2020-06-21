# Task Management System 

# 1. Wireframe
![](https://i.imgur.com/aghViM5.png)

# 2. ERD
![](https://i.imgur.com/7qOgOI9.png)

## 2-1 Model 

### 2-1-1 User
<table>
   <tr>
      <th>Column</th> 
      <th>Type</th> 
   </tr>
   <tr>
      <td>user_id</td> 
      <td>integer</td> 
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
     <td>integer</td> 
   </tr>
   <tr>
     <td>deleted_at</td> 
     <td>datetime</td> 
   </tr>
</table>

### 2-1-2 Task
<table>
   <tr>
      <th>Column</th> 
      <th>Type</th> 
   </tr>
   <tr>
      <td>task_id</td> 
      <td>integer</td> 
   </tr>
   <tr>
     <td>user_id</td> 
     <td>integer</td> 
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
     <td>deleted_at</td> 
     <td>datetime</td> 
   </tr>
</table>


### 2-1-3 Tag
<table>
   <tr>
      <th>Column</th> 
      <th>Type</th> 
   </tr>
   <tr>
     <td>tag_id</td> 
     <td>integer</td> 
   </tr>
   <tr>
     <td>name</td> 
     <td>string</td> 
  </tr>
   <tr>
     <td>deleted_at</td> 
     <td>datetime</td> 
   </tr>
</table>  

### 2-1-4 Task_Tag
<table>
   <tr>
      <th>Column</th> 
      <th>Type</th> 
   </tr>
   <tr>
     <td>task_tag_id</td> 
     <td>integer</td> 
   </tr>
   <tr>
     <td>task_id</td> 
     <td>integer</td> 
  </tr>
   <tr>
     <td>tag_id</td> 
     <td>integer</td> 
  </tr>
</table> 
