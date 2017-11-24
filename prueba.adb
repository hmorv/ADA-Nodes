--Prueba del paquete de nodos.
with  Def_Nodos, Ada.Text_Io, Ada.Integer_Text_Io;
use  Ada.Text_Io, Ada.Integer_Text_Io;



procedure Prueba is

   --Creación de una instancia de Def_Nodos.
   package Car is new Def_Nodos(Character);
   use Car;

   --Variables puntero, que apuntan al tipo Nodo.
   Cabecera,
   Nuevo_Nodo,
   A,
   B,
   C,
   D,
   E          : Puntero_Nodo;

begin

   --Inicialización de los punteros para crear una lista lineal.
   A := new Nodo;
   B := new Nodo;
   C := new Nodo;
   D := new Nodo;
   E := new Nodo;
   Cabecera := A;
   A.Next := B;
   B.Next := C;
   C.Next := D;
   D.Next := E;
   E.Next := null;
   A.Data := 'A';
   B.Data := 'B';
   C.Data := 'C';
   D.Data := 'D';
   E.Data := 'E';
   Nuevo_Nodo := new Nodo;

   --Leer cantidad de elementos.
   Put("The amount of nodes is: ");
   Put(Determinar_Lista(Cabecera),0);
   New_Line;

   --Insertar un nodo en la cabecera.
   Insertar_Nodo_Cola(E, Nuevo_Nodo, 'A');
   Put("Amount of nodes after adding a new one: ");
   Put(Determinar_Lista(Cabecera),0);


   --Put("Amount of nodes after removing a new one: ");
   --exception
   --   when others =>
   --      null;
end Prueba;