import LoginTitle from '../components/LoginTitle';

@Entry
@Component
struct Perfectinfo {
  private selectedDate: Date = new Date('2000-01-01')

  build() {
    Column(){
      LoginTitle({title:'跳过'})
      Column(){
        Text('性别')
        Text('年龄')
        Row(){
          DatePicker({
            start: new Date('1970-1-1'),
            end: new Date(),
            selected: this.selectedDate
          })
            .disappearTextStyle({color: '#FFB0B0B8', font: {size: 18, weight: FontWeight.Regular}})
            .textStyle({color: '#FFB0B0B8', font: {size:18, weight: FontWeight.Regular}})
            .selectedTextStyle({color: '#FF040415', font: {size: 24, weight: FontWeight.Bold}})
            .onDateChange((value: Date) => {
              this.selectedDate = value
              console.info('select current date is: ' + value.toString())
            })
        }.height(210)
        Text('111111111')
      }
    }
  }
}