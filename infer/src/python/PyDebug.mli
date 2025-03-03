(*
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 *)

open! IStd

val p : ?level:int -> ('a, Format.formatter, unit, unit) format4 -> 'a

val enable_debug : unit -> unit [@@warning "-unused-value-declaration"]

val disable_debug : unit -> unit [@@warning "-unused-value-declaration"]
