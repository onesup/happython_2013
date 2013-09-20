클론 후 최초 설치 방법
=================

## Facebook 앱 개설
nitrous.io 와 같은 클라우드 개발환경을 쓰고 있다면 페북 로그인을 테스트하기 위해 별도의 facebook 앱을 https://developers.facebook.com/apps 에서 개설해야합니다.
## facebook.yml 설정
1. ./config/facebook.yml.sample 파일의 복사본 생성.
2. ./config/facebook.yml 으로 복사본의 이름을 변경.
3. development와 test 항목의 `:app_id` 와 `:app_secret` 을 개설한 앱의 app\_id 와 app\_secret 으로 변경.

localhost:3000 을 개발 서버 주소로 사용 가능하다면 3번 과정과 Facebook 앱 개설 과정은 생략 가능합니다.
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
## user, job 모델 설명

user는 job을 만들 수 있습니다.

이 때의 job은 work이라고 부릅니다.(앨리어싱)

이 때 job의 입장에서 본 user는 mentor입니다.

`````````````````````````````````````
shlee = User.where(name: "이수형")
apple_picking = shlee.works.create(title: "사과 수확")

puts apple_picking.mentor.name
이수형
=> nil

`````````````````````````````````````

user는 만들어진 job에 참여할 수 있습니다.

이 때 job의 입장에서 본 user는 mentee입니다.

```````````````````````````````

apple_picking = Job.where(title: "사과 수확")
onesup = User.find_by_name("이원섭").first
apple_picking.mentees << onesup

puts apple_picking.mentees.last.name
이원섭
=> nil

```````````````````````````````

job을 만든 사람을 보기 위해서는

`job.mentor`

job에 참여한 사람들을 보기 위해서는

`job.mentees`

user가 만든 job을 보기 위해서는

`user.wokrs`

user가 참여한 job을 보기 위해서는

`user.jobs`

user, job 모델간의 관계는 이렇게 정리됩니다.
