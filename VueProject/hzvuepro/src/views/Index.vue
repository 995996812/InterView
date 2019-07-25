<template>
  <div>
    <Header></Header>
    <div>
      <div class="middle-content">
        <router-link :to="{path: 'article', query: {id: 1}}">
          <img src="../assets/pic/8.jpg" alt="">
        </router-link>
      </div>
      <List :dataArr="imageSrc"></List>
    </div>
    <Footer></Footer>
  </div>
</template>

<script>
// @ is an alias to /src
import Header from '@/components/Header.vue'
import Footer from '@/components/Footer.vue'
import List from '@/components/List.vue'

export default {
  name: 'Index',
  components: {
    Header,
    Footer,
    List
  },
  data(){
    return {
       imageSrc:[
          {
            "id" : 1,
            "src" :require("@/assets/1/1.jpg"),
            "title": '绘梦夏日 以蕾丝之名与你相遇'
          },
          {
            "id" : 2,
            "src" :require("@/assets/2/2.jpg"),
            "title": '高级定制世代2.0：传统工匠技艺如何与时俱进'
          },
          {
            "id" : 3,
            "src" :require("@/assets/3/3.jpg"),
            "title": '《使女的故事》反乌托邦造型设计背后的故事'
          },
          {
            "id" : 4,
            "src" :require("@/assets/4/4.jpg"),
            "title": '以全球视野培育设计人才 影儿集团力推时尚产业创新升级'
          },
        ]
    }
  }

}
</script>

<style>
body{
  background-color: rgb(242, 242, 242);
}
.middle-content{
  margin: 50px 5vw;
}
.middle-content img{
  width: 100%;
}

</style>

