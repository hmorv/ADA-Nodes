------------------------------------------------------------------------------
--                                                                          --
--                      ADA RUN-TIME LIBRARY COMPONENTS                     --
--                                                                          --
--                               DEF_NODOS                                  --
--                                                                          --
--                                S p e c                                   --
--                                                                          --
--                            $Revision: 1.0$                               --
--                                                                          --
--          Copyright (C) 2005, H&H's Factory, Inc.                         --
--                                                                          --
-- This source code is not free software; you can not redistribute it       --
-- and/or modify at all.                                                    --
-- As a special exception, if other files  instantiate  generics from this  --
-- unit, or you link  this unit with other files to produce an executable,  --
-- you must previously contact me via e-mail.                               --
--                                                                          --
-- Contact e-mail: Thrasher_Moragues@Yahoo.es                               --
-- Developer: Hugo Moragues Valencia                                        --
-- Address: Vicente J. Rossello 52B 1B 07013 Palma de Mallorca              --
-- Phone: +34 610 302 831                                                   --
-- Balearic Islands, Spain                                                  --
------------------------------------------------------------------------------



with Unchecked_Deallocation;

generic
   type Item is private;

package Def_Nodos is


   type Nodo;
   type Puntero_Nodo is access Nodo;
   type Nodo is record
         Data : Item;
         Next : Puntero_Nodo;
   end record;
   
   Nodo_No_Disponible : exception;
   
   procedure Eliminar_Nodo is
   new Unchecked_Deallocation(Nodo, Puntero_Nodo);


   function Determinar_Lista (Cabecera : Puntero_Nodo) return Integer;
   --Esta función recorre la lista lineal y cuenta los nodos que encuentra.


   procedure Insertar_Nodo_Cabecera (Cabecera, Nuevo_Nodo : in out Puntero_Nodo);
   --Este procedimiento agrega un nodo en la cabecera.


   procedure Insertar_Nodo_Cola (Cola : in Puntero_Nodo; Nuevo_Nodo : out Puntero_Nodo; Datos : Item);
   --Agrega un nodo en la cola.


   procedure Insertar_Delante (Puntero : Puntero_Nodo; Nuevo_Nodo : out Puntero_Nodo; Datos : Item);
   --Agrega un nodo en la posición inmediatamente anterior a la determinada por Puntero.


   procedure Insertar_Detras (Puntero : Puntero_Nodo; Nuevo_Nodo : out Puntero_Nodo; Datos : Item);
   --Agrega un nodo en la posición inmediatamente posterior a la determinada por Puntero.


   procedure Eliminar_Sucesor (Viejo_Nodo : out Puntero_Nodo; Nodo_Actual : Puntero_Nodo);
   --Elimina el sucesor a un nodo dado.


   procedure Eliminar_Nodo (Viejo_Nodo : out Puntero_Nodo; Nodo_Actual : Puntero_Nodo);
   --Elimina un nodo apuntado por Viejo_Nodo.

end Def_Nodos;