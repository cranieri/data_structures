require 'rspec'
require_relative '../singly_linked_list'

RSpec.describe 'Singlely Linked List' do
  context '#add_first' do
    context "when the list contains only one node" do
      subject {  SinglyLinkedList.new("first") }

      before { subject.add_first("new_first") }

      it 'adds the element as the head' do
        expect(subject.head.element).to eq("new_first")
      end

      it 'moves the previous head to tail' do
        expect(subject.tail.element).to eq("first")
      end
    end

    context "when two nodes are added" do
      subject {  SinglyLinkedList.new("first") }

      before do
        subject.add_first("new_first_1")
        subject.add_first("new_first_2")
      end

      it 'is inserted as the head' do
        expect(subject.head.element).to eq("new_first_2")
      end

      it 'moves the previous head to tail' do
        expect(subject.tail.element).to eq("first")
      end
    end

    context "when the list is empty" do
      subject {  SinglyLinkedList.new("first") }

      before { subject.remove_first }

      it 'sets head and tail to the added node' do
        subject.add_first("new_element")
        expect(subject.head.element).to eq("new_element")
        expect(subject.tail.element).to eq("new_element")
      end
    end

  end

  context '#add_last' do
    context "when the list is not empty" do
      subject {  SinglyLinkedList.new("first") }
      before do
        subject.add_last("second")
        subject.add_last("third")
        subject.add_last("fourth")
      end

      it 'makes the tail point to added node' do
        subject.add_last("fifth")
        expect(subject.tail.element).to eq("fifth")
      end

      it 'keeps the first element as head' do
        expect(subject.head.element).to eq("first")
      end

      it 'sets the tail next pointer to nil' do
        subject.add_last("fifth")
        expect(subject.tail.next_node).to eq(nil)
      end
    end

    context "when the list is empty" do
      subject {  SinglyLinkedList.new("first") }

      before { subject.remove_first }

      it 'sets head and tail to the added node' do
        subject.add_last("new_element")
        expect(subject.head.element).to eq("new_element")
        expect(subject.tail.element).to eq("new_element")
      end
    end
  end

  context '#remove_first' do
    subject {  SinglyLinkedList.new("first") }
    before do
      subject.add_last("second")
      subject.add_last("third")
      subject.add_last("fourth")
    end

    it 'removes the first node' do
      subject.remove_first
      expect(subject.head.element).to eq("second")
    end
  end

  context '#size' do
    subject {  SinglyLinkedList.new("first") }
    before do
      subject.add_last("second")
      subject.add_last("third")
      subject.add_last("fourth")
    end

    it 'returns the number of node in the list' do
      expect(subject.size).to eq(4)
    end
  end

  context '#to_string' do
    subject {  SinglyLinkedList.new("first") }
    before do
      subject.add_last("second")
      subject.add_last("third")
      subject.add_last("fourth")
    end

    it 'returns the number of node in the list' do
      expect(subject.to_string).to eq("first --> second --> third --> fourth")
    end
  end
end
