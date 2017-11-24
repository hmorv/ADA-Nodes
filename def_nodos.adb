package body Def_Nodos is


   ----------------------
   -- Determinar_Lista --
   ----------------------

   function Determinar_Lista (
         Cabecera : Puntero_Nodo)
     return Integer is
      N       : Integer      := 0;
      Puntero : Puntero_Nodo := Cabecera;
   begin
      while Puntero /= null loop
         N:=N+1;
         Puntero:=Puntero.Next;
      end loop;
      return N;
   end Determinar_Lista;

   -------------------
   -- Eliminar_Nodo --
   -------------------

   procedure Eliminar_Nodo (
         Viejo_Nodo  :    out Puntero_Nodo;
         Nodo_Actual :        Puntero_Nodo) is
   begin
      if Nodo_Actual.Next = null then
         raise Nodo_No_Disponible;
      else
         Viejo_Nodo := Nodo_Actual.Next;
         Nodo_Actual.All := Viejo_Nodo.All;
         Eliminar_Nodo(Viejo_Nodo.Next);
      end if;
   end Eliminar_Nodo;

   ----------------------
   -- Eliminar_Sucesor --
   ----------------------

   procedure Eliminar_Sucesor (
         Viejo_Nodo  :    out Puntero_Nodo;
         Nodo_Actual :        Puntero_Nodo) is
   begin
      if Nodo_Actual.Next = null then
         raise Nodo_No_Disponible;
      else
         Viejo_Nodo := Nodo_Actual.Next;
         Nodo_Actual.Next := Viejo_Nodo.Next;
         Eliminar_Nodo(Viejo_Nodo.Next);
      end if;
   end Eliminar_Sucesor;

   ----------------------
   -- Insertar_Delante --
   ----------------------

   procedure Insertar_Delante (
         Puntero    :        Puntero_Nodo;
         Nuevo_Nodo :    out Puntero_Nodo;
         Datos      :        Item) is
   begin
      Nuevo_Nodo := new Nodo;
      Nuevo_Nodo.All := Puntero.All;
      Puntero.Data := Datos;
      Puntero.Next := Nuevo_Nodo;
   end Insertar_Delante;

   ---------------------
   -- Insertar_Detras --
   ---------------------

   procedure Insertar_Detras (
         Puntero    :        Puntero_Nodo;
         Nuevo_Nodo :    out Puntero_Nodo;
         Datos      :        Item) is
   begin
      Nuevo_Nodo := new Nodo;
      Puntero.Data := Datos;
      Puntero.Next := Nuevo_Nodo;
   end Insertar_Detras;

   ----------------------------
   -- Insertar_Nodo_Cabecera --
   ----------------------------

   procedure Insertar_Nodo_Cabecera (
         Cabecera,
         Nuevo_Nodo : in out Puntero_Nodo) is
   begin
      Nuevo_Nodo := new Nodo;
      Nuevo_Nodo.Next := Cabecera;
      Cabecera := Nuevo_Nodo;
   end Insertar_Nodo_Cabecera;

   ------------------------
   -- Insertar_Nodo_Cola --
   ------------------------

   procedure Insertar_Nodo_Cola (
         Cola       : in     Puntero_Nodo;
         Nuevo_Nodo :    out Puntero_Nodo;
         Datos      :        Item) is
   begin
      Nuevo_Nodo := new Nodo;
      Nuevo_Nodo.Data := Datos;
      Cola.Next := Nuevo_Nodo;
      Nuevo_Nodo.Next := null;
   end Insertar_Nodo_Cola;



end Def_Nodos;