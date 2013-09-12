클론 후 최초 설치 방법
=================

## 번들링
`bundle`
## 개발 데이터베이스 세팅
`rake db:migrate`
## 어드민 계정 생성
`rake db:seed`

[유저별 권한 설정방법(the_role)](https://github.com/the-teacher/the_role)

| id                        | password |
|---------------------------|----------|
| admin@farmfarmmentor.org  | 12341234 |

## 서버 실행
`rails s`

모델간 관계
========
## user, job, application 모델 설명

user는 job을 만들 수 있습니다.

이 때의 job은 work이라고 부릅니다.(앨리어싱)

이 때 job의 입장에서 본 user는 mentor입니다.

`````````````````````````````````````
u = User.where(name: "이수형")
j = u.works.create(title: "사과 수확")

puts j.mentor.name
이수형
=> nil

`````````````````````````````````````

user는 만들어진 job에 참여할 수 있습니다.

이 때 job의 입장에서 본 user는 mentee입니다.

```````````````````````````````

j = Job.where(title: "사과 수확")
u = User.where(name: "이원섭")
j.mentees << u

puts j.mentees.last.name
이원섭
=> nil

```````````````````````````````