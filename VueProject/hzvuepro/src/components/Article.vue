<template> 
    <div>
        <Header></Header>
          
        <article>
            <h1>{{title}}</h1>
            <p>文章导读：清新淡雅的白色，犹如时尚界的纯粹之美，用简洁线条勾勒出一个质感世界；而集浪漫、温柔和性感于一身的蕾丝则像令人魂牵梦萦的艺术珍品，保留着撩动人心的美感。当蕾丝的美与清纯的白色不期而遇，便赋予极简风尚一种前所未有的定义。本季bebe以白色蕾丝单品塑造温婉优雅的夏日风尚，描摹都市女性灵动摇曳的曼妙身姿，诠释你内心的浪漫情怀。</p>
            <img :src="imageSrc" alt="">
            <p>在色彩由浓转淡的盛夏时分，一身洁白更显明媚与醒目。大面积纯色之上，完美的分割线巧妙修饰着身材比例，裙摆处的不规则剪裁脱颖而出，成为自信和质感的最佳注脚，点缀其中的蕾丝花边则令整体造型在简洁优雅之余掠过一丝俏皮，行走间，散落一身灵动妩媚，轻松锁住夏日的所有美丽。</p>
            <p>干净洁白的色调赋予连衣裙无限诗意，在简单中寻找亮点是你对夏日的自我主张。交叉开口蕾丝领口令你瞬间拥有羡煞旁人的完美天鹅颈，多重白色面料交织剪裁令错落的层次感呼之欲出，举手投足间释放出从容不迫的时尚魅力。当你阅尽万般斑斓色彩，会发现最是这不动声色的白与盛夏正相适宜。</p>
            <p>越简约，越需要精致细节的支撑。多种蕾丝组合在经纬如花的交织中叠加时髦与自信，高腰设计勾勒身材的黄金比例，肌肤在精雕细琢的纹理下若隐若现，勾起女人天性中的致美婉约，弥漫着一种欲言又止的节制美感，白色惬意唯美的触感好似方寸间遗落的细腻，恬淡清新让一切都恰到好处。</p>
            <p>如果说飘逸轻灵的梦幻白色，为所有女人构筑了一个童话般的梦，那么曼妙妩媚的蕾丝便为这场梦境了编织了沁人心脾的阵阵清香。袖口与裙摆的优雅刺绣最懂你的时尚心思，简约的廓形中透着态度，表达柔软与随意的个性宣言，足以塑造通勤装扮和聚会时刻的盛装造型，满足都市时髦精游走摩登空间的转场需要。</p>
            <p>让纯白色调给炎炎夏日带去一丝凉意。轻薄透气的吊带小衫凸显迷人香肩和修长颈部，轻松营造出阳光在锁骨间跳舞的时尚韵味，蕾丝基本款短裤在青春俏丽中融入款款女人味，纤纤玉腿散发香风扑面的吸引力，为你带来征服眼球的自信气场。</p>
            <p>时尚的浪潮总是周而复始地轮回，那些留存下来的元素才是无法超越的摩登经典。bebe以白色蕾丝为你构筑优雅的时尚梦境，在光影变幻中，打造动人心魄的女神光晕。</p>
        </article>

        <Footer></Footer>
    </div>
</template>

<script>
import Header from '@/components/Header.vue'
import Footer from '@/components/Footer.vue'
export default {
    name: 'Article',
    components: {
        Header,
        Footer
    },
    data() {
        return {
            id: this.$route.query.id,
            title: this.$route.query.title,
            imageSrc: this.$route.query.imageSrc
        }
    },
    watch: {
        '$route'(){
            this.id = this.$route.query.id,
            this.title = this.$route.query.title
            this.imageSrc = this.$route.query.imageSrc
        }
    }
}
</script>
<!-- Add "scoped" attribute to limit CSS to this component only -->
<style>
article {
    padding: 20px 10vw;
    margin: 50px 0;
    background: #fff;
}
h1{
    text-align: center;
    margin-bottom: 50px;
}
p {
    line-height: 1.8;
    margin-bottom: 25px;
}
img {
    display: block;
    margin: 0 auto 25px;
    width: 100%;
    max-width: 400px;
}
</style>
