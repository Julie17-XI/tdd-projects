require 'first_tdd_projects'

describe Array do
    describe '#my_uniq' do
        context 'empty array' do
            it 'return empty array if self = []' do
                expect([].my_uniq).to be_empty
            end
        end

        context 'no dups array' do
            it 'return itself' do
                expect([1,2,3].my_uniq).to eq([1,2,3])
            end
        end

        context 'has dups' do
            it 'return array with uniq elements' do
                expect([1,2,1,3,3].my_uniq).to eq([1,2,3])
            end
        end
    end

    describe '#two_sum' do
        context 'empty array' do
            it 'return empty array if self = []' do
                expect([].two_sum).to be_empty
            end
        end

        context 'contain one element' do
            it 'return empty array if self only contains one element' do
                expect([-1].two_sum).to be_empty
            end
        end

        context 'no pairs sum up to zero' do
            it 'return empty array if self does not contain two elements which sum to zero' do
                expect([-1,2,0,3].two_sum).to be_empty
            end
        end

        context 'has pairs sum up to zero' do
            it 'return an array contains positions of pairs which sum up to zero' do
                expect([-1,0,2,-2,1].two_sum).to eq([[0,4],[2,3]])
            end
        end

        context 'duplicate pairs' do
            it 'return positions in order' do
                expect([-1,1,-1,1].two_sum).to eq([[0,1],[0,3],[1,2],[2,3]])
            end
        end
        
    end

    describe '#my_transpose' do
        context 'empty array' do
           it 'returns empty array' do
                expect([].my_transpose).to be_empty
           end 
        end

        context 'square matrix' do
            it 'tranposes the matrix' do
                expect([[0,1,2],[3,4,5],[6,7,8]].my_transpose).to eq([[0,3,6],[1,4,7],[2,5,8]])
            end
        end
    end
end


describe 'stock_picker' do
    context 'empty array' do
        it 'returns empty array' do
            expect(stock_picker([])).to be_empty
        end 
    end

    context 'fluctuated prices' do
        it 'returns the pair of days produce the greatest profit' do
            stock_prices = [10,13,15,28,21,5,12,8]
            expect(stock_picker(stock_prices)).to eq([0,3])
        end
    end
end

describe TowersofHanoi do
    describe '#move' do
        context 'move to empty stack' do
            let(:game){ TowersofHanoi.new([[3,2,1],[],[]]) }
            it 'shall succeed' do
                game.move(0,1)
                expect(game.stacks).to eq([[3,2],[1],[]])
            end
        end

        context 'move onto larger disk' do
            let(:game){ TowersofHanoi.new([[3],[2],[1]]) }
            it "shall succeed"  do
                game.move(2,0)
                expect(game.stacks).to eq([[3,1],[2],[]])
            end
        end

        context 'move onto smaller disk' do
            let(:game){ TowersofHanoi.new([[3],[2],[1]]) }
            it "raise error"  do
                expect{game.move(1,2)}.to raise_error("can't move a larger disk onto a smaller one")
            end
        end
    end

    describe "#won?" do
        let(:game){ TowersofHanoi.new([[2,1],[],[]]) }
        before(:each) do
            game.move(0,2)
            game.move(0,1)
            game.move(2,1)
        end

        it "should return true" do
            expect(game).to be_won
            #expect(game.won?).to be true
        end
    end
end


    

