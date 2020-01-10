# Implementation patterns

## Chapter 7

### Behavior

John von Neumann introdueces a primary metaphors of computing. Control Flow is a fundamental organizing principle.

### Control Flow

> Express computation as a sequence of steps

Every programm has a control of flow excpeting prolog. 


 ### Main Flow
 
 > Clearly express the main flow of control 
 
 Just focus on the main flow instead of exceptional parts/facts/details, which are selten changed. Main Flow will be often read, much ofter than the exceptional flow. Try to concentrate on invariant parts (Requirement is no requirement).
 
 ### Message
  
  > Express control flow by sending a message. 
  
  It's a fundamental control flow mechanism. Change is the base state of programs. Every message is the potential place, where the receiver of the message can be changed without changing the sender. 
  
  Procedure calls are a mechanism for hiding information, but reveals intention. 
  
  ```
 METHOD compute.
    input( ).
    process( ).
    output( ).
 ENDMETHOD.
  ```
  
 ### Choosing message - Polymorphic message
 
 > Vary the implementors of a message to express choices. 
 
Sometime you can send a polymorphic message to communicate that there can be several ways of implementation and which to choose will take at the runtime. Each choosing message is an invitation to later extension. 
To understand the concept the reader must look at several class, that's the cost of it. That's why it's important to use intenion-revealing names. 

Sometimes polymorphic messege is a overkill, if there is no variation of computation and you introduce it. 

 ```
 METHOD display_graphic. 
    io_medium.display( io_graphic ).
 ENDMETHOD.
 
 ```
 
 ### Double Dispatch
 
 > Vary the implementors of messages along two axes to express cascading choices. 
 
 ### Decomposing (Sequencing) Message
 
 > Break complicated calculations into cohesive chunks. 
 
It's just old-fashioned functional decomposition. Complicated steps are divided in well naming methods. In this case we have something like IOSP Integration Method, which communicates messages in a good way. Also for long parameterlists messaging is not good, try to use helper object to communicate the purpose better. 
 
  ```
 METHOD print_graphic. 
    reserve_memory( ).
    print_graphic( ).
    free_memory( ).
 ENDMETHOD.
 
 METHOD reserve_memory. 
    check_register( ).
    move_register( ).
 ENDEMTHOD.
 
 ```
 
### Reversing Message
   
   > Make control flows symmetric by sending a sequence of messages to the same receiver. 
   
Try to follow the symmetry regarding who is sending a message. If you need, than hide the called object with delegation concept.
The parameterlist communicates that there is some object passed, so the reader get an attation, that there might be something more in the body of the method. Be aware, that sometimes overusing the reversing message is a sign, that the logic should go to the caller class.
     
  ```
 METHOD compute. 
    input( ).
    helper->process( this ).
    output( ).
 ENDMETHOD.
 
 METHOD compute. 
    input( ).
    process( helper ).
    output( ).
 ENDMETHOD.
 
 METHOD process. 
    helper->process( this ).
 ENDMETHOD.
 ```
   
However always pass the parameter around many methods is disturbing. Try to store the value of the object as an instance field. 

  ```
 METHOD compute. 
    input( ).
    process( ).
    output( ).
 ENDMETHOD.
 
 METHOD process. 
    mo_helper->process( this ).
 ENDMETHOD.

 ```

 ### Inviting Message
 
 > Invite future variation by sending a message that can be implemented in different ways.
 
 
Sometimes you write code and you would like to communicate for the later use, that this code can be vary in some subclasses to change some part of computation. Send an appropriately named message for this purpose. 

If there is a default implementation of the logic, make it the implementation of the message. If not declare it as abstract to make an invitation explicit. 

 ### Explaining Message 
 
 > Send a message to explain the purpose of a clump of logic
 
Try to name method after it's intention not implementation. Send an explaining message of your method. If somebody would like to see the detailf of implementation, he can look at the body of the method. Use intermediate or high level of abstraction for method calls. Low level abstraction - detail implementation - only in the IOSP-Operation. 
 

 ### Exceptional Flow
 
 
 ### Guard Clause
  
  
> wskazuje roznice miedzy main flow i exceptional flow
> warunki specjalnej 

Programy maja pewny przeply glowny, ale czasami moze zaistniec sytuacja, ze bedzie trzeba go wykonac innymi sciezkami. Klausula straznika pozwala wyrazic prosta i logiczna sytuacje wyjatkowa. Tutaj chodzi o to, aby wskazac roznice miedzy przetwarzaniem normalnym i specjalym.
 
In this example the more important flow is, what happens if the object is already initialize.
  
 ```
 METHOD compute. 
   IF is_initialized( ).
      operate( ).
   ELSE. 
      initialize( ).
   ENDIF.
 ENDMETHOD.
 ```
 
Szczegolnie uzyteczny, jesli kontrolowanych jest wiele warunkow. Normalny IF-ElSE reprezentuje jakies problemy. Zastosowanie straznika wskazuje na warunki wstepne, ktore musza byc spelnione, aby zadanie zostalo wykonane. Ten kod czyta sie lepiej niz zagniezdzone struktury.
 
 ```
 METHOD compute. 
   DATA(lo_server) = new ycl_server( ).
   IF lo_server IS INITIAL. 
      EXIT.
   ENDIF.
   
   DATA(lo_client) = server.getClient( ).
   IF lo_cleint IS INITIAL. 
      EXIT.
   ENDIF.
   
   DATA(lo_current_request) = client.getRequest( ).
   IF lo_request IS INITIAL.
      EXIT.
   ENDIF
   
   processRequest( lo_current_request ).
   
 ENDMETHOD.
 ```
 
 W ponizszym przykladzie chodzi rowniez o wskazanie roznicy miedzy przetwarzaniem normalnym i specjalnym.
 
  ```
  LOOP AT mt_table INTO DATA(ls_structure). 
    IF ls_structure-component IS INITIAL. 
       do_exceptional_flow( ). 
       CONTINUE.
    ENDIF.
    
    do_main_flow_operation( ).
    
  ENDIF.
  
  ```
 
