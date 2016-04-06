teletraan Cookbook
==================
Installs teletraan deploy service and deploy-board

Requirements:
----------
Install Java 8 and Python2.7 with pip with your favouite cookbook for the purpose

Attributes
----------
#### teletraan::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['teletraan']['release_version']</tt></td>
    <td>string</td>
    <td>teletraan version</td>
    <td><tt>v1.0.1</tt></td>
  </tr>
  <tr>
    <td><tt>['teletraan']['deploy_service_version']</tt></td>
    <td>string</td>
    <td>deploy service version</td>
    <td><tt>fdd68c0</tt></td>
  </tr>
  <tr>
    <td><tt>['teletraan']['deploy_board_version']</tt></td>
    <td>string</td>
    <td>deploy board protocol</td>
    <td><tt>fdd68c0</tt></td>
  </tr>
</table>

Usage
-----
#### teletraan::default
e.g.
Just include `teletraan` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[teletraan]"
  ]
}
```

Contributing
------------
e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: deathowl