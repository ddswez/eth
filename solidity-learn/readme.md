### 关键字
view：
memory：

### 动态长度字节数组
1. bytes的初始化  new bytes() 获取bytes的长度和内容，并修改长度内容
2. string 不能直接获取长度和内容 需要转化成bytes
3. 将bytes转化成string
···
bytes name = new bytes(2);
name[0] = 0x7a;
name[1] = 0x68;
return string[name];
···
4. 将bytes32转化成string
···
bytes32 name = 0x7a68;
bytes memory _newName = new bytes(name.length);
for (uint i = 0; i < name.length; i++) {
  _newName[i] = name[i];
}
return string[_newName];
···

###  
