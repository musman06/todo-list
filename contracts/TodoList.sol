pragma solidity ^0.5.0;

contract TodoList {
constructor() public {
        createTask("Complete Project");
      }
  uint public taskCount = 0;
  
  struct Task {
    uint id;
    string content;
    bool completed;
  }
   event TaskCreated(
    uint id,
    string content,
    bool completed
  );
  event taskCompleted(
    uint id,
    bool completed
  );

  mapping(uint => Task) public tasks;

  function createTask(string memory _content) public {
    taskCount ++;
    tasks[taskCount] = Task(taskCount, _content, false);
    emit TaskCreated(taskCount, _content, false);
  } 
  function toggleCompleted(uint _id) public {
    Task memory _task = tasks[_id];
    _task.completed = !_task.completed;
    tasks[_id] = _task;
    emit taskCompleted(_id, _task.completed);
  }
}
