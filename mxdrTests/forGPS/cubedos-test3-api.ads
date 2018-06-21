--------------------------------------------------------------------------------
-- FILE   : cubedos-test3-api.ads
-- SUBJECT: Specification of a package that defines the test3 API
-- AUTHOR : (C) Copyright 2017 by Vermont Technical College
-- All the subprograms in this package must be task safe. They can be simultaneously
--called from multiple tasks. If possible, make every subprogram here a pure function.
--------------------------------------------------------------------------------
pragma SPARK_Mode(On);

with CubedOS.Lib;
with Message_Manager;  use Message_Manager;
with System;

package CubedOS.test3.API is

   type Message_Type is
      (ms1, 
      ms);

   type f1 is new Integer range 1 .. 100;

   type f2 is array (0 .. 5) of f1;

   type f3 is new Lib.Quadruple_Octet range 1 .. 100;

   type f4 is array (0 .. 5) of f3;

   type f5 is new Lib.Hyper_Type range 1 .. 100;

   type f6 is array (0 .. 5) of f5;

   type f7 is new Lib.U_Hyper_Type range -11 .. 100;

   type f8 is array (0 .. 5) of f7;

   type f9 is new Float range -1.12 .. 100.0;

   type f10 is array (0 .. 5) of f9;

   type f11 is new Double range 1.23 .. 100.67;

   type f12 is array (0 .. 5) of f11;

   type e1_Intermediary is
      (red, 
      blue, 
      green);

   type e1 is array (0 .. 2) of e1_Intermediary;

   type b is new Boolean;

   type b1 is array (0 .. 2) of b;

   type int_var is array (0 .. 2) of Integer;

   type s1_Intermediary is
      record
         fs1 : f2;
         fs2 : f4;
         fs3 : f6;
         fs4 : f8;
         fs5 : f10;
         fs6 : f12;
         e2 : e1;
         iv : int_var;
         i : Integer;
         hyp1 : Lib.Hyper_Type;
      end record;

   type s1 is array (0 .. 2) of s1_Intermediary;

   function ms_Encode
      (Receiver_Domain : Domain_ID_Type;
      Receiver  : Module_ID_Type;
      mss1 : s1;
      e3 : e1;
      b2 : b1;
      h1 : Integer;
      Priority : System.Priority := System.Default_Priority) return Message_Record
   with
      Global => null;

   function Is_ms(Message : Message_Record) return Boolean is
      (Message.Receiver = ID and Message.Message_ID = Message_Type'Pos(ms));

   procedure ms_Decode
      (Message : in  Message_Record;
      mss1 : out s1;
      e3 : out e1;
      b2 : out b1;
      h1 : out Integer;
      Decode_Status : out Message_Status_Type)
   with
      Global => null,
      Pre => Is_ms(Message),
      Depends => ((mss1, e3, b2, h1, Decode_Status) => Message);


   function ms1_Encode
      (Receiver_Domain : Domain_ID_Type;
      Receiver  : Module_ID_Type;
      --TODO
      Priority : System.Priority := System.Default_Priority) return Message_Record
   with
      Global => null;

   function Is_ms1(Message : Message_Record) return Boolean is
      (Message.Receiver = ID and Message.Message_ID = Message_Type'Pos(ms1));



end CubedOS.test3.API;