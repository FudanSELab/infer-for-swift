(*
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 *)

open! IStd

type t [@@deriving compare, equal, yojson_of, sexp, hash]

val make : package:string option -> typename:string -> t

val from_string : string -> t

val to_string : t -> string
(** [to_string (from_string "X.Y.Z") = "X.Y.Z"] *)

val pp : Format.formatter -> t -> unit
(** [pp] includes package if any *)

val pp_with_verbosity : verbose:bool -> Format.formatter -> t -> unit
(** if [verbose] then print package if present, otherwise only print class *)

val package : t -> string option

val typename : t -> string

module Normalizer : HashNormalizer.S with type t = t
