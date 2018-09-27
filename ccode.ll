; ModuleID = 'ccode.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.node = type { i32, %struct.node*, %struct.node* }

; Function Attrs: nounwind uwtable
define void @traverse(%struct.node* %n) #0 {
  %1 = alloca %struct.node*, align 8
  store %struct.node* %n, %struct.node** %1, align 8
  %2 = load %struct.node** %1, align 8
  %3 = icmp eq %struct.node* %2, null
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  br label %19

; <label>:5                                       ; preds = %0
  %6 = load %struct.node** %1, align 8
  %7 = getelementptr inbounds %struct.node* %6, i32 0, i32 0
  %8 = load i32* %7, align 4
  %9 = load %struct.node** %1, align 8
  %10 = getelementptr inbounds %struct.node* %9, i32 0, i32 1
  %11 = load %struct.node** %10, align 8
  %12 = getelementptr inbounds %struct.node* %11, i32 0, i32 0
  store i32 %8, i32* %12, align 4
  %13 = load %struct.node** %1, align 8
  %14 = getelementptr inbounds %struct.node* %13, i32 0, i32 1
  %15 = load %struct.node** %14, align 8
  call void @traverse(%struct.node* %15)
  %16 = load %struct.node** %1, align 8
  %17 = getelementptr inbounds %struct.node* %16, i32 0, i32 2
  %18 = load %struct.node** %17, align 8
  call void @traverse(%struct.node* %18)
  br label %19

; <label>:19                                      ; preds = %5, %4
  ret void
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.6.2-3ubuntu2 (tags/RELEASE_362/final) (based on LLVM 3.6.2)"}
