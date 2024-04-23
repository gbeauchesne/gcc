------------------------------------------------------------------------------
--                                                                          --
--                 GNAT RUN-TIME LIBRARY (GNARL) COMPONENTS                 --
--                                                                          --
--                  S Y S T E M . C _ T I M E                               --
--                                                                          --
--                                  S p e c                                 --
--                                                                          --
--          Copyright (C) 1998-2024, Free Software Foundation, Inc.         --
--                                                                          --
-- GNARL is free software; you can  redistribute it  and/or modify it under --
-- terms of the  GNU General Public License as published  by the Free Soft- --
-- ware  Foundation;  either version 3,  or (at your option) any later ver- --
-- sion.  GNAT is distributed in the hope that it will be useful, but WITH- --
-- OUT ANY WARRANTY;  without even the  implied warranty of MERCHANTABILITY --
-- or FITNESS FOR A PARTICULAR PURPOSE.                                     --
--                                                                          --
-- As a special exception under Section 7 of GPL version 3, you are granted --
-- additional permissions described in the GCC Runtime Library Exception,   --
-- version 3.1, as published by the Free Software Foundation.               --
--                                                                          --
-- You should have received a copy of the GNU General Public License and    --
-- a copy of the GCC Runtime Library Exception along with this program;     --
-- see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see    --
-- <http://www.gnu.org/licenses/>.                                          --
--                                                                          --
-- GNARL was developed by the GNARL team at Florida State University.       --
-- Extensive contributions were provided by Ada Core Technologies, Inc.     --
--                                                                          --
------------------------------------------------------------------------------

--  This package provides the timeval, timespec C types and conversions.
--  It hides all details about time_t, suseconds_t.

with Interfaces.C;
private with System.OS_Constants;

package System.C_Time
  with Preelaborate
is

   type timeval is private;  --  Non negative duration in microseconds.

   Timeval_Zero : constant timeval;
   --  g-sothco.ads

   function To_Timeval (D : Duration) return timeval
     with Pre => 0.0 <= D;
   --  The value is rounded if Duration'Size = 64.

   function In_Duration (T : timeval) return Boolean
     with Inline;
   --  True if computing To_Duration (T) is safe,
   --  False if Constraint Error would be raised.

   function To_Duration (T : timeval) return Duration
     with Post => 0.0 <= To_Duration'Result;
   --  The value is rounded if Duration'Size = 32.

   type timespec is private;  --  Non negative duration in nanoseconds.

   function To_Timespec (D : Duration) return timespec
     with Pre => 0.0 <= D;

   function To_Duration (T : timespec) return Duration
     with Post => 0.0 <= To_Duration'Result;
   --  The value is rounded if Duration'Size = 32.

   --  Direct conversions avoiding an intermediate Duration that may
   --  loose precision (when Duration'Size = 32) or overflow (when
   --  time_t'Size = 64).

   function Milliseconds_To_Timeval (M : Interfaces.C.int) return timeval
     with Inline,
          Pre => Interfaces.C."<=" (0, M);

   function Nanoseconds_To_Timespec (N : Interfaces.C.int) return timespec
     with Inline,
          Pre => Interfaces.C."<=" (0, N);

   function To_Timespec (T : timeval) return timespec
     with Inline;

private

   type time_t is range -2 ** (OS_Constants.SIZEOF_tv_sec * 8 - 1) ..
                         2 ** (OS_Constants.SIZEOF_tv_sec * 8 - 1) - 1
     with Convention => C, Size => OS_Constants.SIZEOF_tv_sec * 8;

   type suseconds_t is range -2 ** (OS_Constants.SIZEOF_tv_usec * 8 - 1) ..
                              2 ** (OS_Constants.SIZEOF_tv_usec * 8 - 1) - 1
     with Convention => C, Size => OS_Constants.SIZEOF_tv_usec * 8;

   type snseconds_t is range -2 ** (OS_Constants.SIZEOF_tv_nsec * 8 - 1) ..
                              2 ** (OS_Constants.SIZEOF_tv_nsec * 8 - 1) - 1
     with Convention => C, Size => OS_Constants.SIZEOF_tv_nsec * 8;

   type timeval is record
      tv_sec  : time_t range 0 .. OS_Constants.MAX_tv_sec;  -- seconds
      tv_usec : suseconds_t range 0 .. 999_999;             -- microseconds
   end record
     with Convention => C;

   type timespec is record
      tv_sec  : time_t range 0 .. OS_Constants.MAX_tv_sec;  -- seconds
      tv_nsec : snseconds_t range 0 .. 999_999_999;         -- nanoseconds
   end record
     with Convention => C;

   Timeval_Zero : constant timeval := (tv_sec => 0, tv_usec => 0);

end System.C_Time;
