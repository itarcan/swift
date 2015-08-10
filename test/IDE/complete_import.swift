// RUN: %target-swift-ide-test -code-completion -source-filename %s -F %S/Inputs/mock-sdk -code-completion-token=CLANG_IMPORT1 | FileCheck %s -check-prefix=CLANG_IMPORT1
// RUN: %target-swift-ide-test -code-completion -source-filename %s -F %S/Inputs/mock-sdk -code-completion-token=CLANG_IMPORT2 | FileCheck %s -check-prefix=CLANG_IMPORT2

import #^CLANG_IMPORT1^#

// CLANG_IMPORT1:	Begin completions
// CLANG_IMPORT1-DAG:	Decl[Module]/OtherModule[Foo]:                       Foo[#Module#]; name=Foo
// CLANG_IMPORT1-DAG:	Decl[Module]/OtherModule[FooHelper]:                 FooHelper[#Module#]; name=FooHelper
// CLANG_IMPORT1-DAG:	Decl[Module]/OtherModule[Bar]:                       Bar[#Module#]; name=Bar
// CLANG_IMPORT1-NOT:	SwiftShims

import Foo

import #^CLANG_IMPORT2^#

// CLANG_IMPORT2: Begin completions
// CLANG_IMPORT2-NOT:	Foo[#Module#]; name=Foo
// CLANG_IMPORT2-NOT:	FooHelper[#Module#]; name=FooHelper
// CLANG_IMPORT2-NOT:	SwiftShims
// CLANG_IMPORT2-DAG:	Decl[Module]/OtherModule[Bar]:                       Bar[#Module#]; name=Bar
