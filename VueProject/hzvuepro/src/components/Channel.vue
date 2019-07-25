<template>
    <div>
        <Header></Header>
        <div>
            <div v-if="id == 1">
                <List :dataArr="imageSrc.trend"></List>
            </div>
            <div v-if="id == 2">
                <List :dataArr="imageSrc.beauty"></List>
            </div>
            <div v-if="id == 3">
                <List :dataArr="imageSrc.jewelry"></List>
            </div>
        </div>
        <Footer></Footer>
    </div>
</template>

<script>

import Header from '@/components/Header.vue'
import Footer from '@/components/Footer.vue'
import List from '@/components/List.vue'

export default {
    name: 'Channel',
    components: {
        Header,
        Footer,
        List
    },
    data() {
        return{
            id: this.$route.query.id,
            imageSrc:{
                trend:[
                    {
                        "id" : 5,
                        "src" :require("@/assets/5/5.jpg"),
                        "title": 'Marchesa 如何重返红毯'
                    },
                    {
                        "id" : 6,
                        "src" :require("@/assets/6/6.jpg"),
                        "title": '引爆2019春夏高定周的9大话题之作'
                    },
                    {
                        "id" : 7,
                        "src" :require("@/assets/7/7.jpg"),
                        "title": '传承艺术，至臻优雅'
                    },
                    {
                        "id" : 8,
                        "src" :require("@/assets/8/8.jpg"),
                        "title": '独家：2019春夏高级定制秀场地抢先看'
                    },
                ],
                beauty:[
                    {
                        "id" : 9,
                        "src" :require("@/assets/9/9.jpg"),
                        "title": '为什么现在的时尚界里没有超级男模了?'
                    },
                    {
                        "id" : 10,
                        "src" :require("@/assets/10/10.jpg"),
                        "title": '高订起死回生背后的原因'
                    },
                    {
                        "id" : 11,
                        "src" :require("@/assets/11/11.jpg"),
                        "title": '最新指南：认识男性时尚变化的面貌'
                    },
                    {
                        "id" : 12,
                        "src" :require("@/assets/12/12.jpg"),
                        "title": '2019年9个时尚趋势'
                    },
                ],
                jewelry:[
                    {
                        "id" : 13,
                        "src" :require("@/assets/13/13.jpg"),
                        "title": '你参加过最棒的一次派对是什么?'
                    },
                    {
                        "id" : 14,
                        "src" :require("@/assets/14/14.jpg"),
                        "title": '出自3位名人造型师的红毯服装掌握之法'
                    },
                    {
                        "id" : 15,
                        "src" :require("@/assets/3/3.jpg"),
                        "title": '高级定制世代2.0：传同工匠技艺如何与时俱进'
                    },
                    {
                        "id" : 16,
                        "src" :require("@/assets/10/10.jpg"),
                        "title": '以全球视野培育设计人才影儿集团力推时尚产业创新升级'
                    },
                ]
            },
        }
    },
    watch: {
        '$route' () {
         // 对路由变化作出响应...
         this.id = this.$route.query.id
        }
    }
}

</script>

<style>

</style>
