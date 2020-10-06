echo "working directory: "
read dir
#입력이 없는 경우에는 현재 디렉토리에서 진행
#입력이 없는 경우 따로 처리할 일은 없음
#입력이 있는 경우에는 디렉토리를 옮겨서 진행
#디렉토리 명이 맞는지, 실행 가능한 디렉토리인지 판별
#디렉토리가 아니거나, 실행 불가일 경우 에러 메세지 출력 후 종료
if test "$dir" != ""; then
	if test -d "$dir" && test -x "$dir"; then
		cd $dir
	else
		echo "Error, not a directory or unexecutable!"
		exit
	fi
fi

#디렉토리 변경이 완료 되었으면
#디렉토리 내부 파일들에 대해서 파일명 변경 작업 실행
for name in *
do
	mv $name `echo $name | tr '[a-z][A-Z]' '[A-Z][a-z]' `
done

