(*
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 *)

open! IStd
module F = Format
module AbstractValue = PulseAbstractValue
module BaseMemory = PulseBaseMemory
module BaseAddressAttributes = PulseBaseAddressAttributes
module CallEvent = PulseCallEvent
module DecompilerExpr = PulseDecompilerExpr
module ValueHistory = PulseValueHistory

(** {1 Describe abstract values in terms of source code elements} *)

type t

val pp : F.formatter -> t -> unit

val empty : t

val invalid : t

val add_var_source : AbstractValue.t -> Var.t -> t -> t

val add_call_source :
  AbstractValue.t -> CallEvent.t -> ((AbstractValue.t * ValueHistory.t) * Typ.t) list -> t -> t

val add_access_source :
  AbstractValue.t -> BaseMemory.Access.t -> src:AbstractValue.t -> BaseAddressAttributes.t -> t -> t

val find : AbstractValue.t -> t -> DecompilerExpr.t
