<template>
    <div>
          <div class="bottom-list">
            <div v-for="(imageData, index) in dataArr" :key="index">
              <div class="list-article">
                <router-link :to="{path:'article', query: {id: imageData.id, title: imageData.title, imageSrc: imageData.src}}">
                  <img :src="imageData.src" alt="">
                  <div class="list-title">
                    <h2>{{imageData.title}}</h2>
                  </div>
                </router-link>
              </div>
            </div>
          </div>
    </div>
</template>

<script>

export default {
    name: "list",
    props:["dataArr"],
    data(){
        return {
            
        }
    }
}
</script>

<style>
.bottom-list{
  padding: 50px 5vw;
  display: flex;
  justify-content: space-between;
  background-color: white;
  margin-bottom: 50px;
}
.list-article{
  width: 300px;
  height: 440px;
}

.list-title{
  float:right;
  position: relative;
  width: 200px;
  padding: 20px;
  background: white;
  margin-top: -50px;
}

.list-title h2 {
  color: black;
  font-size: 20px;
}

.list-article img{
  display: block;
  width: 300px;
  height: 440px;
}
</style>
