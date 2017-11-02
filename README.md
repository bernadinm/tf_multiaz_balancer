# tf_multiaz_balancer
A module to help distribute nodes across zones. This is useful for cloud providers where regions have multiple datacenters. ie. region: us-west-1, zones: us-west-1a, us-west-1b, us-west-1c

## Module Input Variables

### Required Variables

### Outputs 

### Example Usage


```
  A      B       C
____    ____    ____     
|   |   |   |   |   |     
| x |   | x |   | x |     
| x |   | x |   |   |     
|   |   |   |   |   |     
-----   -----   -----     
        

var custom_zone_remove (b) yeilds


  A      B       C
____    ____    ____     
|   |   |   |   |   |     
| x |   |   |   | x |     
| x |   |   |   | x |     
| x |   |   |   |   |     
-----   -----   -----     

var custom_zone_remove (null) yeilds
        
  A      B       C
____    ____    ____     
|   |   |   |   |   |     
| x |   | x |   | x |     
| x |   | x |   |   |     
|   |   |   |   |   |     
-----   -----   -----     
        

var custom_zone_remove (b,c)


  A      B       C
____    ____    ____      
| x |   |   |   |   |     
| x |   |   |   |   |     
| x |   |   |   |   |     
| x |   |   |   |   |     
-----   -----   -----     
```
